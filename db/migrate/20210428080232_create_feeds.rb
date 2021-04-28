class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.integer :timestamps, null: false
      t.integer :feed_point, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
