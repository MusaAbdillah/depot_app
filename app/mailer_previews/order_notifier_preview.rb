class OrderNotifierPreview
  def received
    OrderNotifier.received order
  end


  def shipped
    OrderNotifier.shipped order
  end
end
