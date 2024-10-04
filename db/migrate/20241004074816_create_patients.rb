class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :contact_info
      t.text :medical_history

      t.timestamps
    end
  end
end
