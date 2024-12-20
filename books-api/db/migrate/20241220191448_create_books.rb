class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :publication_date
      t.integer :rating
      t.string :status

      t.timestamps
    end
  end
end
