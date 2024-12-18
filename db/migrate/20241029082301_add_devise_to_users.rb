# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # Removing columns that already exist
      # t.string :email, null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # Removing columns that already exist
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at # Uncomment if not already present

      ## Rememberable
      # t.datetime :remember_created_at

      ## Trackable
      # Uncomment these lines if you need the Trackable functionality
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # Uncomment these lines if you need Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # Uncomment these lines if you need Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    # Adding indexes if they do not exist already
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    # Uncomment these lines if you need Confirmable or Lockable
    # add_index :users, :confirmation_token, unique: true unless index_exists?(:users, :confirmation_token)
    # add_index :users, :unlock_token, unique: true unless index_exists?(:users, :unlock_token)
  end

  def self.down
    # Since we are not sure about removing pre-existing columns, keep this irreversible
    raise ActiveRecord::IrreversibleMigration
  end
end
