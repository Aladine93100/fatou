class PhotosController < ApplicationController
def upload
  File.open(upload_path, 'w') do |f|
    f.write request.raw_post
  end
  render :text => "ok"
end
 
 def create
  @photo = Photo.new(params[:photo])
  @photo.image = File.new(upload_path)
  @photo.save
 
  redirect_to @photo
end
 
def show
  @photo = Photo.find(params[:id])
end
 
def index
  @photos = Photo.all
end

private
 
def upload_path # is used in upload and create
  file_name = session[:session_id].to_s + '.jpg'
  File.join(RAILS_ROOT, 'public', 'uploads', file_name)
end
end
