class AddCloudToSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :summaries, :tag_cloud, :string
  end
end
