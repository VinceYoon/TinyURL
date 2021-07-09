class RenameTableName < ActiveRecord::Migration[5.2]
  def change
  	rename_table :tiny_urls, :links
  end
end
