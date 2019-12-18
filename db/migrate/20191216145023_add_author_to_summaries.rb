class AddAuthorToSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :summaries, :article_author, :string
  end
end
