class AddSyndicatedAtToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :syndicated_at, :datetime
  end
end
