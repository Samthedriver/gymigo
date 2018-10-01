class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :city
      t.string :experience
      t.text :goals

      t.timestamps
    end
  end
end
