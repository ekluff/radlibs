class AddAttachmentAssetToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :stories, :asset
  end
end
