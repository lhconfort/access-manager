module AccessManager
  module ViewHelpers
    def initialize_user_actions!(user)
      hidden_field_tag 'current_user_actions', user.action_codes.to_json
    end
  end
end
