class Club < ActiveRecord::Base
  has_many :posts, dependent: :destroy #deletes posts if club is deleted
  belongs_to :user

  accepts_nested_attributes_for :posts

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :description, :presence => true
end
