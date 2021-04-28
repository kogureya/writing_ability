class RemoveTimestampsFromFeeds < ActiveRecord::Migration[6.0]
  def change
    remove_column :feeds, :timestamps, :integer
  end
end
