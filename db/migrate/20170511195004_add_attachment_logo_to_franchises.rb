class AddAttachmentLogoToFranchises < ActiveRecord::Migration
  def self.up
    change_table :franchises do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :franchises, :logo
  end
end
