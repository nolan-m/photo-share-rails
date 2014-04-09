class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.integer :user_id
      t.attachment :photo
      t.timestamps
    end
  end
end
