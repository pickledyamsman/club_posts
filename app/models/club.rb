class Club < ActiveRecord::Base
  has_many :posts, dependent: :destroy #deletes posts if club is deleted
  belongs_to :user
  belongs_to :type
  has_many :members

  accepts_nested_attributes_for :members

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :description, :presence => true

  def members_attributes=(member_attribute)
    member = Member.find_or_create_by(member_attribute)
    self.member = member
  end

  def display_member(member)
    "#{member.position} - #{member.name}"
  end
end
