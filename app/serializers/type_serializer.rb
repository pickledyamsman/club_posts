class TypeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clubs, serializer: ClubSerializer
end
