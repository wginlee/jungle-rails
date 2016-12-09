class UserMailer < ApplicationMailer
  def order_receipt(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "[#{@order.id}] Your order has been processed!" )
  end

end
