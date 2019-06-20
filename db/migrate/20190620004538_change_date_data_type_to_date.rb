class ChangeDateDataTypeToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :subrequests, :date, :date
  end
end
