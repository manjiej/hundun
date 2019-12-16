class AddImageToSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :summaries, :image, :text
  end
end
