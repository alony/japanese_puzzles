class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :crypted_password,    :null => false                # optional, see below
      t.string :password_salt,       :null => false                # optional, but highly recommended
      t.string :persistence_token,   :null => false                # required
      t.string :perishable_token,    :null => false                # required

      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
