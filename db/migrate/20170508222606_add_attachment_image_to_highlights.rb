class AddAttachmentImageToHighlights < ActiveRecord::Migration
  def self.up
    change_table :highlights do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :highlights, :image
  end
end
