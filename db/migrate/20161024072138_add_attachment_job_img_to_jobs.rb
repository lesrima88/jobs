class AddAttachmentJobImgToJobs < ActiveRecord::Migration
  def self.up
    change_table :jobs do |t|
      t.attachment :job_img
    end
  end

  def self.down
    remove_attachment :jobs, :job_img
  end
end
