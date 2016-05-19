class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :club_id
  has_one :club
end
