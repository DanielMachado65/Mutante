class RemoveFieldLoginAndPasswordFromMutante < ActiveRecord::Migration[5.2]
  def change
    remove_column :mutantes, :login, :string
    remove_column :mutantes, :password, :string
  end
end
