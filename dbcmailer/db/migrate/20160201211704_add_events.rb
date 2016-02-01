class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.references :group

      t.timestamps null: false
    end
  end
end
