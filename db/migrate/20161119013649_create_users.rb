class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :party
      t.string :picture
      t.string :other_data
      t.text :dataset, array: true, default: []
    end
  end
end
