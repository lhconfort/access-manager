module AccessManager
  module Control
    def can_access?(controller, action)
      actions.any? { |user_action| self.class.access_granted?(controller, action, user_action) }
    end

    def can?(action)
      actions.include?(action.to_s)
    end
  end
end
