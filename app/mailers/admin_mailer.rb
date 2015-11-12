class AdminMailer < ApplicationMailer  
  def notify_support(order, subject_suffix="New Order")
    @order = order
    @warrior = @order.customer
    
    mail(to: 'order@gelangharapan.org', subject: "[#{ApplicationController::SITE_NAME} #{@order.id}] #{subject_suffix}")
  end
end
