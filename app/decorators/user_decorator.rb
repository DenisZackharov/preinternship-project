class UserDecorator < ApplicationDecorator
  delegate :id, :firstname, :lastname, :email

  def firstname_with_email
    "#{object.firstname} (#{object.email})"
  end
end
