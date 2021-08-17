class UserParameterSanitizer < Devise::ParameterSanitizer
  USER_PARAMS = %i[
    firstname
    lastname
    email
    password
    password_confirmation
  ].freeze

  def initialize(*)
    super
    permit(:sign_up, keys: USER_PARAMS)
    permit(:account_update, keys: USER_PARAMS)
  end
end
