class CreateRevisions < ActiveRecord::Migration[6.0]
  def change
    create_table :revisions do |t|
      t.string :title
      t.text :content
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
