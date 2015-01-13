class Post < ActiveRecord::Base

# Validations
validates :title, presence: true
validates :content, presence: true

# Associations
belongs_to :user
has_many :comments

end
