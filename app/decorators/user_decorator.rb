class UserDecorator < ApplicationDecorator
  delegate :id, :firstname, :lastname, :email
  
  def fullname_with_email
    "#{object.firstname} #{object.lastname} (#{object.email})"
  end

  def fullname
    "#{object.firstname} #{object.lastname}"
  end
end
