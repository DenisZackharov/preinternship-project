class UserDecorator < ApplicationDecorator
  delegate :id, :firstname, :lastname, :email

  def fullname
    "#{object.firstname} #{object.lastname}"
  end
end
