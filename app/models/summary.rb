class Summary < ApplicationRecord
  belongs_to :user
  validates :article_url, presence: true

  # acts_as_taggable_on :tags

end
