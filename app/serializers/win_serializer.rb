class WinSerializer
  include JSONAPI::Serializer
  
  attribute :user_name do |object|
    User.find(object.user_id).name
  end

  attributes :entry,
             :created_at
end
