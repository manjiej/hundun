class AddDigestToSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :summaries, :digest, :text
  end
end
