class ImagesController < ApplicationController
  include Sort
  
  layout 'admin'

  before_filter :admin_authorize
  before_filter :validate_admin_permission
  
  def create    
    @image = Image.new({image: params[:image], content_id: content_id, content_type: content_type})
    if @image.save
      render :json => { :files => [{
                                    "image_id" => @image.id,
                                    "name" => @image.image_file_name,
                                    "size" => @image.image_file_size,
                                    "url" => @image.image.url,
                                    "sort" => @image.sort,
                                    "thumbnail_url" => @image.image.url(:thumb),
                                    "delete_url" => delete_url,
                                    "delete_type" => @image.image_content_type
                                  }] }
    else
      render :json => [ {:error => "custom_failure"} ], :status => 404
    end
  end
  
  def destroy
    @image = Image.find(params[:id]).destroy
    redirect_to redirect_url
  end
  
  def sort
    Image.sort!(episode_params[:sort])
    flash[:success] = 'Image Sort success!'
    redirect_to redirect_url
  end
  
  protected
    
    def parent_controller
      if params[:news_id]
        'news'
      elsif params[:event_id]
        'events'
      elsif params[:gallery_id]
        'galleries'
      elsif params[:story_id]
        'stories'
      end
    end
    
    def content_id
      case parent_controller
      when 'news';      params[:news_id]
      when 'events';    params[:event_id]
      when 'galleries'; params[:gallery_id]
      when 'stories';  params[:story_id]
      end      
    end
    
    def content_type
      case parent_controller
      when 'news';      'News'
      when 'events';    'Event'
      when 'galleries'; 'Gallery'
      when 'stories';  'Story'
      end
    end
        
    def delete_url
      case parent_controller
      when 'news';      admin_contents_news_image_url(id: @image.id)
      when 'events';    admin_contents_event_image_url(id: @image.id)
      when 'galleries'; admin_contents_gallery_image_url(id: @image.id)
      when 'stories';  admin_contents_story_image_url(id: @image.id)
      end
    end
    
    def redirect_url
      case parent_controller
      when 'news';      edit_admin_contents_news_url(id: content_id, anchor: 'images')
      when 'events';    edit_admin_contents_event_url(id: content_id, anchor: 'images')
      when 'galleries'; edit_admin_contents_gallery_url(id: content_id, anchor: 'images')
      when 'stories';  edit_admin_contents_story_url(id: content_id, anchor: 'images')
      end
    end
end
