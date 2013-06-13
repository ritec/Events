class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :namre
      t.string :location
      t.decimal :price

      t.timestamps
    end
  end
end
