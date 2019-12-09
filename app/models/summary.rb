class Summary < ApplicationRecord
  belongs_to :article
  belongs_to :user

  acts_as_taggable_on :tags

end
