class Club < ActiveRecord::Base
  has_many :posts, dependent: :destroy #deletes posts if club is deleted
  belongs_to :user
  belongs_to :type
  has_many :members

  accepts_nested_attributes_for :members, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :description, :presence => true

  def member_attributes=(member_attribute)
    member << Member.find_or_create_by(member_attribute)
  end
end
