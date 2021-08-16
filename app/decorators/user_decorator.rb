class UserDecorator < ApplicationDecorator
  delegate :id, :firstname, :lastname, :email

  def firstname_lastname_with_email
    "#{object.firstname} #{object.lastname} (#{object.email})"
  end
end
