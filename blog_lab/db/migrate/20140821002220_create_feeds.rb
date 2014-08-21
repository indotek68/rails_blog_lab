class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
    	t.references :post
    	t.references :tag
      t.timestamps
    end
  end
end
