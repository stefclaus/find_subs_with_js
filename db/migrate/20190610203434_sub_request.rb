class SubRequest < ActiveRecord::Migration[5.2]
  def change
    create_table :subrequests do |t|
      t.string :comment
      t.integer :assistant_id
      t.integer :yogaclass_id

      t.timestamps
    end
  end
end
