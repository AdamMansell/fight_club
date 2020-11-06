# frozen_string_literal: true

class CreateFighters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.integer :height
      t.string :type_of_fighter

      t.timestamps
    end
  end
end
