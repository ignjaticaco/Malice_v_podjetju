class AddAdminToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :admin, foreign_key: true
  end
end
