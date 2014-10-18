class AddPropsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :string
    add_column :users, :location, :string
    add_column :users, :address_state, :string
    add_column :users, :gender, :string
    add_column :users, :mobile, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :state, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :string
  end
end
