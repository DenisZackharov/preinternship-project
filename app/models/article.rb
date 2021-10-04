class Article < ApplicationRecord

  extend Enumerize

  belongs_to :user

  validates :title, :content, presence: true, length: { minimum: 3 }

  enumerize :status, in: ["public", "draft", "archive"], scope: :shallow

end
