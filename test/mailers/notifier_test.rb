require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Dextron Ims Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["dextronims@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_approved" do
    mail = Notifier.order_approved(orders(:one))
    assert_equal "Request approved", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["dextronims@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
