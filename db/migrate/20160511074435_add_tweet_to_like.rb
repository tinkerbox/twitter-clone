class AddTweetToLike < ActiveRecord::Migration
  def change
    add_reference :likes, :tweet
  end
end
