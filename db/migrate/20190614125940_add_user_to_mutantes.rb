class AddUserToMutantes < ActiveRecord::Migration[5.2]
  def change
    add_reference :mutantes, :user, foreign_key: true
  end
end
