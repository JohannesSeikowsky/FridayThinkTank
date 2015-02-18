class Profile < ActiveRecord::Base
  # The Paperclip Image attachment
  has_attached_file :image, styles: { medium: "320x240" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
end
