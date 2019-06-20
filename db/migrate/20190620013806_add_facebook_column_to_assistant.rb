class AddFacebookColumnToAssistant < ActiveRecord::Migration[5.2]
  def change
    add_column :assistants, :uid, :string
  end
end
