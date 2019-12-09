class AddUrlToSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :summaries, :article_url, :string
  end
end
