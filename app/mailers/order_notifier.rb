class OrderNotifier < ApplicationMailer
  default from: 'AB OnlineShop<musaabdillahm9@gmail.com>'
  #include line_items helper on view
  helper LineItemsHelper
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order 

    mail to: order.email, subject: "AB OnlineShop Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order 

    mail to: @order.email, subject: "AB OnlineShop Order Shipped"
  end
end
