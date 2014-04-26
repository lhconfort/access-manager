module AccessManager
  module Control
    def can_access?(controller, action)
      action_codes.any? { |user_action| access_granted?(controller, action, user_action) }
    end

    def can?(action)
      action_codes.map(&:to_s).include?(action.to_s)
    end

    def access_granted?(controller, action, user_action)
      if @access_tree.nil?
        set_grants!
      end

      if @access_tree.nil? || @access_tree.empty?
        return false
      end

      controller_grants = @access_tree[controller.to_sym]

      if controller_grants.nil?
        false
      elsif controller_grants['@all'] && controller_grants['@all'].include?(user_action.to_sym)
        true
      elsif controller_grants[action.to_sym].nil?
        false
      else
        controller_grants[action.to_sym].include?(user_action.to_sym)
      end
    end

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
  end
end
