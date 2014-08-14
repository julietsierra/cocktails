class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.references :ingredients, index: true
      t.references :cocktails, index: true

      t.timestamps
    end
  end
end
