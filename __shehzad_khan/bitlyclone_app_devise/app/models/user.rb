class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end

# migration
class DeviseCreateUsers < ActiveRecord::Migration
  def change
  	create_table(:users) do |t|
  		t.database_authenticatable :null => false
  		t.recoverable
  		t.rememberable
  		t.trackable

  		t.timestamps
  	end

  	add_index :users, :email, 				 :unique => true
  	add_index :users, :reset_password_token, :unique => true
  end

end