class Profile < ActiveRecord::Base
  # The Paperclip Image attachment
  has_attached_file :image, styles: { medium: "320x240" }

  belongs_to :user
end
