class Article < ApplicationRecord
  extend Enumerize

  paginates_per 5
  acts_as_taggable_on :tags

  AVALIABLE_STATUSES = ["public", "draft", "archive"].freeze

  belongs_to :user

  validates :title, :content, presence: true, length: { minimum: 3 }
  validates :status, presence: true

  enumerize :status, in: AVALIABLE_STATUSES , scope: :shallow, default: :draft
end
