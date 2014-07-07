class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)

    @order = order
    

    mail to: order.email, :subject => 'Dextron Ims Request COnfrimation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_approved.subject
  #
  def order_approved
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
