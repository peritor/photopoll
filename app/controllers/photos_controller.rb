class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    begin
      @top_photos = Photo.find(:all, :limit => 3, :joins => :ratings, :group => 'ratings.photo_id', :having => 'ratings.value > 2')
    rescue
      @top_photos = []
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      flash[:notice] = 'Photo was successfully created.'
      redirect_to(@photo) 
    else
      render :action => "new"
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      flash[:notice] = 'Photo was successfully updated.'
      redirect_to(@photo)
    else
      render :action => "edit"
    end  
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to(photos_url)
  end
  
  def vote
    @photo = Photo.find(params[:id])
    rating = Rating.new(:value => params[:vote], :photo => @photo, :comment => params[:comment])
    rating.save!
    render :nothing => true
  end
  
  def search
    if params[:query].blank? || params[:query].to_s.strip.blank?
      @photos = Photo.all
    else
      query = '%' + params[:query].to_s.downcase + '%'
      conditions = ["LOWER(name) LIKE ? ", query]
      if params[:include_comments].to_s == 'on'
        conditions = [conditions.first + " OR LOWER(ratings.comment) LIKE ?", conditions.last, query ]
      end
      if params[:limit_to_recents].to_s == 'on'
        conditions = ["( " + conditions.shift + " ) AND photos.created_at >= ?", *(conditions << 1.day.ago) ]
      end

      @photos = Photo.find(:all, :joins => :ratings, :conditions => conditions).uniq
    end
  end
end
