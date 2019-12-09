class RemoveArticleFromSummaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :summaries, :article_id
  end
end
