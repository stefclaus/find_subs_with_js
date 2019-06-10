class CreateSubrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :subrequests do |t|
      t.string :comment
      t.date :date
      t.string :assistant_requesting
      t.string :assistant_covering
      t.integer :assistant_id
      t.integer :yogaclass_id

      t.timestamps
    end
  end
end
