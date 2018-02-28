class Profile < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
end
