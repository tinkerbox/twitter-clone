class AddUserToTweet < ActiveRecord::Migration
  def change
    remove_column :tweets, :author, :string
    add_reference :tweets, :user
  end
end
