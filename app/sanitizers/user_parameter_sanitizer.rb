class UserParameterSanitizer < Devise::ParameterSanitizer
  SIGN_UP_PARAMS = %i[
    firstname
    lastname
    email
    password
    password_confirmation
  ].freeze

  UPDATE_PARAMS = %i[
    firstname
    lastname
    email
    password
  ].freeze

  def initialize(*)
    super
    permit(:sign_up, keys: SIGN_UP_PARAMS)
    permit(:account_update, keys: UPDATE_PARAMS)
  end
end
