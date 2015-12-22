class AddAttachmentFotoToPratos < ActiveRecord::Migration
  def self.up
    change_table :pratos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :pratos, :foto
  end
end
