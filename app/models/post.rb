class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, :body, :author, presence: true
end
