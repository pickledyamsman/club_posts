class ClubSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :member_number, :type_id
  has_many :posts, serializer: PostSerializer
  has_many :members, serializer: MemberSerializer
end
