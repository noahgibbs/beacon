class IssueComment < ApplicationRecord

  attr_accessor :commenter_id

  before_create :set_commenter_encrypted_id

  def commenter
    @commenter ||= Account.find(EncryptionService.decrypt(self.commenter_encrypted_id))
  end

  private

  def set_commenter_encrypted_id
    self.commenter_encrypted_id = EncryptionService.encrypt(self.commenter_id)
  end

end
