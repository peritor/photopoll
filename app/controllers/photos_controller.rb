class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @top_photos = Photo.find(:all, :limit => 3, :joins => :ratings, :group => 'ratings.photo_id', :having => 'ratings.value > 3')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Photo was successfully created.'
        format.html { redirect_to(@photo) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to(@photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
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

      @photos = Photo.find(:all, :joins => :ratings, :conditions => conditions).uniq
    end
  end
end
