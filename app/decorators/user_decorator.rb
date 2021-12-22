class UserDecorator < ApplicationDecorator
  delegate :id, :firstname, :lastname, :email
end
