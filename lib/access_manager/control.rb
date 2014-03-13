module AccessManager
  module Control
    def can_access?(controller, action)
      action_codes.any? { |user_action| self.class.access_granted?(controller, action, user_action) }
    end

    def can?(action)
      action_codes.map(&:to_s).include?(action.to_s)
    end
  end
end
