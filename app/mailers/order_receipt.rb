class OrderReceipt < ApplicationMailer

  def receipt(order)
    @user_email = order.email
    @order_id = order.id
    mail  :to => @user_email, 
          :from => ENV["EMAIL_USER"]
  end
end
