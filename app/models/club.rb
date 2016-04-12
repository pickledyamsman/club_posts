class Club < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :users, through: :posts

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :description, :presence => true
end
