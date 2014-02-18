module AccessManager
  module Rules
    attr_accessor :access_tree

    def grant_access_with(user_action, args={})
      if @access_tree.nil?
        @access_tree = { }
      end

      args[:to].each do |controller, actions|
        if @access_tree[controller.to_sym].nil?
          @access_tree[controller.to_sym] = { }
        end

        if actions == :all
          if @access_tree[controller.to_sym]['@all'].nil?
            @access_tree[controller.to_sym]['@all'] = []
          end

          @access_tree[controller.to_sym]['@all'] << user_action
        else
          actions.each do |action|
            if @access_tree[controller.to_sym][action.to_sym].nil?
              @access_tree[controller.to_sym][action.to_sym] = []
            end

            @access_tree[controller.to_sym][action.to_sym] << user_action
          end
        end
      end
    end

    def access_granted?(controller, action, user_action)
      if @access_tree.nil?
        @access_tree = { }
      end

      if @access_tree[controller.to_sym].nil?
        true
      elsif ((!@access_tree[controller.to_sym]['@all'].nil?) && @access_tree[controller.to_sym]['@all'].any?)
        @access_tree[controller.to_sym]['@all'].include?(user_action.to_sym)
      elsif @access_tree[controller.to_sym][action.to_sym].nil?
        true
      else
        @access_tree[controller.to_sym][action.to_sym].include?(user_action.to_sym)
      end
    end
  end
end
