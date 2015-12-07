class PagesController < ApplicationController
  before_filter :initialize_cart
  before_filter :assign_instance_variables
  before_filter :validate_login, only: [:share_story]
  
  def show
    redirect_to '/'
  end
  
  def story
    @story = Story.new
    @stories = Story.all.active
  end
  
  def share_story
    @story = Story.new(story_params)
    @story.customer_id = customer['id']
    @story.status_id = Story.unmoderated
    @story.publish_at = Time.now
    if @story.save
      flash[:success] = "Thank you for sharing your story"
      redirect_to pages_story_url and return
    else
      @stories = Story.all.active.order(:sort)
      flash[:error] = 'We cannot save your story at the moment'
      render 'pages/story' and return
    end
  end
 
  def story_detail
    @story = Story.find(params[:id])
  end
  
  def cart
    case params[:state]
    when 'error'
      flash[:error] = 'We are sorry, we cannot process your payment at the moment'
    end
  end
  
  def bracelet
    case params[:state]
    when 'success'
      flash[:success] = 'Thank you, you have successfully purchased our bracelet'
    end
  end
  
  def add_bracelet
    add_bracelet_to_cart(params[:bracelet])
    flash[:success] = "You have added #{params[:bracelet][:name]} bracelet to your cart"
    redirect_to pages_bracelet_url(anchor: 'items') and return
  end

  def modify_cart
    if cart_item_index = shopping_cart['items'].index {|item| item['name'] == params[:name]}
      original_quantity = shopping_cart['items'][cart_item_index]['quantity'].to_i
      modified_quantity = case params[:operation]
                          when 'add'
                            shopping_cart['items'][cart_item_index]['quantity'] = original_quantity + 1
                          when 'sub'
                            shopping_cart['items'][cart_item_index]['quantity'] = original_quantity - 1
                          when 'delete'
                            shopping_cart['items'][cart_item_index]['quantity'] = 0
                          end
      
      shopping_cart['items'].delete_at(cart_item_index) if modified_quantity == 0
    end
    redirect_to pages_cart_url and return
  end
  
  protected
  
    def add_bracelet_to_cart(bracelet)
      shopping_cart['items'] ||=[]
      if cart_item_index = shopping_cart['items'].index {|item| item['name'] == bracelet['name']}
        original_quantity = shopping_cart['items'][cart_item_index]['quantity'].to_i
        shopping_cart['items'][cart_item_index]['quantity'] = original_quantity + 1
      else
        shopping_cart['items'] << bracelet.merge({quantity: 1})
      end
    end
    
    def story_params
      params.require(:story).permit!
    end
    
    
end
