class Letter < ApplicationRecord

  belongs_to :activity
  belongs_to :type_of_letter

  mount_uploader :file, FileUploader

end
