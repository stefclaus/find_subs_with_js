class CreateYogaclasses < ActiveRecord::Migration[5.2]
  def change
    create_table :yogaclasses do |t|
      t.string :name
      t.string :time
      t.string :weekday
      t.string :instructor

      t.timestamps
    end
  end
end
