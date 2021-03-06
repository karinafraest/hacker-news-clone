class Post < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :comments
  has_many :votes

  validates :title, presence: true
  validates :url, presence: true
end
