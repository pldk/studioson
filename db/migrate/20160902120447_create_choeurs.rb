class CreateChoeurs < ActiveRecord::Migration
  def change
    create_table :choeurs do |t|

      t.timestamps null: false
    end
  end
end
