class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.integer :point, null: false
      t.references :diary, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
