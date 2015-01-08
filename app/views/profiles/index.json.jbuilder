json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :description, :image_url, :email, :website_url, :user_id
  json.url profile_url(profile, format: :json)
end
