class CreateSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :summaries do |t|
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
