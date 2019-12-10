class Summary < ApplicationRecord
  belongs_to :user, optional: true
<<<<<<< HEAD
=======
  belongs_to :taggable, polymorphic: true

>>>>>>> ae24e32f8824eb096ad5fba02139a83e148497c8
  validates :article_url, presence: true

  acts_as_taggable_on :tags

end
