class Image < ApplicationRecord
  # mount_uploader :image, ImageUploader
  belongs_to :imageable, polymorphic: true
  # belongs_to :campaign
  # belongs_to :user

  # mount_uploader :image, ImageUploader

  validates_presence_of :image
  # validates :image, file_size: { less_than: 1.megabytes }
            # file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }
  attr_accessible :image
  has_attached_file :image
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
