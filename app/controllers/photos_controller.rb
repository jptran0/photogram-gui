class PhotosController < ApplicationController
  def index
    render template: "photos/index"
  end

  def show
    @photo = Photo.where({id: params.fetch("id")})[0]
    render template: "photos/show"
  end

  def create
    @photo = Photo.new

    @photo.image = params.fetch("image")
    @photo.caption = params.fetch("caption")
    @photo.owner_id = params.fetch("user_id")

    if @photo.valid?
      @photo.save
      redirect_to "/photos", notice: "Photo added successfully."
    else
      redirect_to "/photos", alert: @photo.errors.full_messages.to_sentence
    end
  end

  def update
    @photo = Photo.where({id: params.fetch("photo_id")})[0]

    @photo.image = params.fetch("image")
    @photo.caption = params.fetch("caption")

    if @photo.valid?
      @photo.save
      redirect_to "/photos/#{params.fetch("photo_id")}", notice: "Photo updated successfully."
    else
      redirect_to "/photos/#{params.fetch("photo_id")}", alert: @photo.errors.full_messages.to_sentence
    end
  end
end
