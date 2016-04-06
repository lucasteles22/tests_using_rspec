class User < ActiveRecord::Base
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, :message => 'E-mail no formato inválido!'

  def full_name
    "#{first_name} #{last_name}" if self.first_name.present? && self.last_name.present?
  end
end
