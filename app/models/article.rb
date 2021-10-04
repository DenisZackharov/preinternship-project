class Article < ApplicationRecord

  extend Enumerize

  belongs_to :user

  validates :title, :content, presence: true, length: { minimum: 3 }

  validates :status, presence: true

  enumerize :status, in: ["public", "draft", "archive"], scope: :shallow

end
