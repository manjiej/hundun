class AddDateToSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :summaries, :publish_date, :string
  end
end
