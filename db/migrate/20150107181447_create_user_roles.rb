class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :roles_users do |t|
      t.references :user, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end
