class AddAttachmentImageToFranchises < ActiveRecord::Migration
  def self.up
    change_table :franchises do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :franchises, :image
  end
end
