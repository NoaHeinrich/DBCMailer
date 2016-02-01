class AddEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user
      t.references :group

      t.timestamps null: false
    end
  end
end
