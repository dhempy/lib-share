class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :url
      t.text :comment
      t.integer :create_user
      t.string :timestamps

      t.timestamps
    end
  end
end
