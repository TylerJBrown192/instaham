class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.column :user_id, :integer
      t.column :caption, :string

      t.timestamps
    end
  end
end
