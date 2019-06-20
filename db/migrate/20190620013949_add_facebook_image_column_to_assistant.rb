class AddFacebookImageColumnToAssistant < ActiveRecord::Migration[5.2]
  def change
    add_column :assistants, :image, :string
  end
end
