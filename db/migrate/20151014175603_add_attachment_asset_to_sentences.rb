class AddAttachmentAssetToSentences < ActiveRecord::Migration
  def self.up
    change_table :sentences do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :sentences, :asset
  end
end
