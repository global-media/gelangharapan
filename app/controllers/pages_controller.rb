class PagesController < ApplicationController
  
  before_filter :assign_instance_variables

  def show
    redirect_to '/'
  end
  
  def add_bracelet
    add_bracelet_to_cart(params[:bracelet])
    redirect_to pages_bracelet_url and return
  end

  def modify_bracelet
    if cart_item_index = cart['items'].index {|item| item['name'] == params[:name]}
      original_quantity = cart['items'][cart_item_index]['quantity']
      modified_quantity = case params[:operation]
                          when 'add'
                            cart['items'][cart_item_index]['quantity'] += 1
                          when 'sub'
                            cart['items'][cart_item_index]['quantity'] -= 1
                          when 'delete'
                            cart['items'][cart_item_index]['quantity'] = 0
                          end
      
      cart['items'].delete_at(cart_item_index) if modified_quantity == 0
    end
    redirect_to pages_cart_url and return
  end
  protected
  
    def add_bracelet_to_cart(bracelet)
      cart['items'] ||=[]
      if cart_item_index = cart['items'].index {|item| item['name'] == bracelet['name']}
        cart['items'][cart_item_index]['quantity'] += 1
      else
        cart['items'] << bracelet.merge({quantity: 1})
      end
    end
    
    def assign_instance_variables
      flash.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
end
