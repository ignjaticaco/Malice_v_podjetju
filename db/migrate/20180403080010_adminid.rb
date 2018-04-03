class Adminid < ActiveRecord::Migration
  def change
    add_reference :posts, :admin, foreign_key: true
  end
end
