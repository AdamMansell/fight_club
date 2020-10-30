class CreateFighters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string, :name
      t.int, :age
      t.int, :weight
      t.int, :height
      t.string :type

      t.timestamps
    end
  end
end
