class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
