class StoriesController < ApplicationController
  layout 'admin'

  def index
    @stories = Story.all.order(:sort)
  end
  
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:success] = 'Story Create success!'
      redirect_to edit_admin_contents_story_url(id: @story.id) and return
    end
    @errors = @story.errors
    flash[:error] = "We're sorry, we cannot create the story at the moment"
    render template: 'stories/new'
  end
  
  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
      flash[:success] = 'Story Update success!'
      redirect_to edit_admin_contents_story_url and return
    end
    @errors = @story.errors
    flash[:error] = "We're sorry, we cannot update the story at the moment"
    render template: 'stories/edit'
  end
  
  def destroy
    Story.find(params[:id]).destroy
    redirect_to admin_contents_stories_url
  end
  
  def sort
    Story.sort!(params[:story][:sort])
    flash[:success] = 'Story Sort success!'
    redirect_to admin_contents_stories_url
  end
  
  protected
    
    def story_params
      params.require(:story).permit!
    end
end
