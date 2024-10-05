class AddIsDeletedToPatients < ActiveRecord::Migration[7.2]
  def change
    add_column :patients, :is_deleted, :boolean, default: false
  end
end