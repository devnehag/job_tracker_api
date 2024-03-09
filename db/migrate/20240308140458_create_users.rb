class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: false do |t|
      t.primary_key :user_id
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
