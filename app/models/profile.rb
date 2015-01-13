class Profile < ActiveRecord::Base
  # The Paperclip Image attachment
  has_attached_file :image, styles: { medium: "320x240" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment :image, presence: true

  belongs_to :user
end
