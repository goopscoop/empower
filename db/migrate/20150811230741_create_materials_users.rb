class CreateMaterialsUsers < ActiveRecord::Migration
  def change
    create_table :materials_users do |t|
      t.references :material, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
