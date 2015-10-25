class VideosController < ApplicationController
  layout 'admin'

  def index
    @videos = Video.all.order(:sort)
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'Video Create success!'
      redirect_to edit_admin_contents_video_url(id: @video.id) and return
    end
    @errors = @video.errors
    flash[:error] = "We're sorry, we cannot create the video at the moment"
    render template: 'videos/new'
  end
  
  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      flash[:success] = 'Video Update success!'
      redirect_to edit_admin_contents_video_url and return
    end
    @errors = @video.errors
    flash[:error] = "We're sorry, we cannot update the video at the moment"
    render template: 'videos/edit'
  end
  
  def destroy
    Video.find(params[:id]).destroy
    redirect_to admin_contents_videos_url
  end
  
  def sort
    Video.sort!(params[:video][:sort])
    flash[:success] = 'Video Sort success!'
    redirect_to admin_contents_videos_url
  end
  
  protected
    
    def video_params
      params.require(:video).permit!
    end
end
