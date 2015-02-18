class Profile < ActiveRecord::Base
  # The Paperclip Image attachment
  has_attached_file :image, styles: { medium: "320x240" }

  validates_attachment content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }

  belongs_to :user
end
