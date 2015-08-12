class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.text :body
      t.string :kind

      t.timestamps null: false
    end
  end
end
