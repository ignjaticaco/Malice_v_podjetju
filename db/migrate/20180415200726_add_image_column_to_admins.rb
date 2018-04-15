class AddImageColumnToAdmins < ActiveRecord::Migration
  def up
    add_attachment :admins, :avatar
  end

  def down
    remove_attachment :admi, :avatar
  end
end
