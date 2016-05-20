class TypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :clubs
  has_many :clubs, serializer: ClubSerializer
end
