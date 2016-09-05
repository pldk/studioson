class AddColumnsToChoeurs < ActiveRecord::Migration
  def change
    add_column :choeurs, :name, :string
    add_column :choeurs, :email, :string
    add_column :choeurs, :description, :text
    add_column :choeurs, :start_time, :datetime
    add_column :choeurs, :end_time, :datetime
  end
end
