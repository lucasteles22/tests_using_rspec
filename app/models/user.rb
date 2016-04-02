class User < ActiveRecord::Base
  has_many :posts, foreign_key: 'author_id'

  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  def full_name
    "#{first_name} #{last_name}" if self.first_name.present? && self.last_name.present?
  end
end
