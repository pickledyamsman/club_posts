class Member < ActiveRecord::Base
  belongs_to :club

  def self.search(position)
    Member.all.select{|member| member.position == position}
  end
end
