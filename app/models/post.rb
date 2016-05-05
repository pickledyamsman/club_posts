class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :club

  validates :content, :presence => true
  validates :title, :presence => true
end
