# Preview all emails at http://localhost:3000/rails/mailers/order_receipt
class OrderReceiptPreview < ActionMailer::Preview

  def OrderReceiptPreview
    @order = Order.last
    OrderReceipt.receipt(@order)
  end

end
