class WinSerializer
  include JSONAPI::Serializer
  attributes :entry
             :created_at
  attribute :user_name do |object|
    User.find(object.user_id).name
  end
end
