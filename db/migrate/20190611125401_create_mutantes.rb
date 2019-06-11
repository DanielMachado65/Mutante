class CreateMutantes < ActiveRecord::Migration[5.2]
  def change
    create_table :mutantes do |t|
      t.string :name
      t.string :password
      t.string :hability
      t.string :login
      t.text :picture

      t.timestamps
    end
  end
end
