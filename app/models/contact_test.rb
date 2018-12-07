require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test 'responds to name, email and body' do 
    msg = Contact.new

    assert msg.respond_to?(:name),  'does not respond to :name'
    assert msg.respond_to?(:email), 'does not respond to :email'
    assert msg.respond_to?(:body),  'does not respond to :body'
  end
end
