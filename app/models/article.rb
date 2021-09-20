class Article < ApplicationRecord

  include Draft

  belongs_to :user

  validates :title, :content, presence: true, length: { minimum: 3 }
end
