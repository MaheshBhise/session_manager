class CreateSessionManagerSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :session_manager_sessions do |t|
      t.string :email, null: false
      t.integer :user_id, null: false
      t.string :token, null: false, index: true
      t.string :user_agent, null: false
      t.string :ip_address, null: false
      t.datetime :login_time, null: false
      t.datetime :logout_time
      t.datetime :last_seen, null: false
      t.boolean :archived, null: false, default: false

      t.timestamps
    end
  end
end
