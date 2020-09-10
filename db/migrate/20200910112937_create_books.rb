class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :image_url
      t.string :title
      t.string :author
      t.date :date
      t.text :note

      t.timestamps
    end
  end
end
