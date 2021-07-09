class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :tiny_urls do |t|
    	t.string :token
    	t.text :url
    	t.integer :visits, default: 0

    	t.timestamps null: false
    end
    add_index :tiny_urls, [:token], unique: true
  end
end
