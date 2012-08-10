class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clocks do |t|
      t.string :name
      t.integer :diff

      t.timestamps
    end
  end
end
