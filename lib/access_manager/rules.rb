module AccessManager
  module Rules
    attr_accessor :access_tree

    def grants_access_with(user_action, args={})
      if @access_tree.nil?
        @access_tree = { }
      end

      args[:to].each do |controller, actions|
        if actions == :all
          if @access_tree[controller].nil?
            @access_tree[controller] = { }
          end

          if @access_tree[controller]['@all'].nil?
            @access_tree[controller]['@all'] = []
          end

          @access_tree[controller]['@all'] << user_action
        else7
          actions.each do |action|
            if @access_tree[controller][action].nil?
              @access_tree[controller][action] = []
            end

            @access_tree[controller][action] << user_action
          end
        end
      end
    end

    private

    def access_granted?(controller, action, user_action)
      if @access_tree[controller.to_sym].nil?
        true
      elsif @access_tree[controller.to_sym]['@all'].present?
        @access_tree[controller.to_sym]['@all'].include?(user_action.to_sym)
      elsif @access_tree[controller.to_sym][action.to_sym].nil?
        true
      else
        @access_tree[controller.to_sym][action.to_sym].include?(user_action.to_sym)
      end
    end
  end
end
