class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :club_id
  has_one :club
end
