class AddAdoptStatusToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adopt_status, :boolean, default: false
  end
end
