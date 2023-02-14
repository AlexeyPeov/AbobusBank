class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :firstName
      t.string :secondName
      t.string :age
      t.float :balance

      t.timestamps
    end

    #add_reference :users, :account, foreign_key: true
  end
end
