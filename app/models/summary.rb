class Summary < ApplicationRecord
  belongs_to :user, optional: true
  # belongs_to :taggable, polymorphic: true

  validates :article_url, presence: true

  acts_as_taggable_on :tags

end
