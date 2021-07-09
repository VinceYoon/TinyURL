class RenameUrlToOriginalUrl < ActiveRecord::Migration[5.2]
  def up
  	rename_column :tiny_urls, :url, :original_url
  end

  def down
  	rename_column :tiny_urls, :original_url, :url
  end
end
