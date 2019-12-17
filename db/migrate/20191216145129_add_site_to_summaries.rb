class AddSiteToSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :summaries, :site_name, :string
  end
end
