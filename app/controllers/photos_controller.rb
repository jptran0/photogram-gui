class PhotosController < ApplicationController
  def index
    @photos = Photo.order({created_at: :desc})
    render template: "photos/index"
  end

  def show
    @photo = Photo.where({id: params.fetch("id")})[0]

    @comments = @photo.comments.order({ created_at: :desc })
    render template: "photos/show"
  end

  def create
    photo = Photo.new

    photo.image = params.fetch("image")
    photo.caption = params.fetch("caption")
    photo.owner_id = params.fetch("user_id")

    if photo.valid?
      photo.save
      redirect_to "/photos", notice: "Photo added successfully."
    else
      redirect_to "/photos", alert: photo.errors.full_messages.to_sentence
    end
  end

  def update
    photo = Photo.where({id: params.fetch("id")})[0]

    photo.image = params.fetch("image")
    photo.caption = params.fetch("caption")

    if photo.valid?
      photo.save
      redirect_to "/photos/#{params.fetch("id")}", notice: "Photo updated successfully."
    else
      redirect_to "/photos/#{params.fetch("id")}", alert: photo.errors.full_messages.to_sentence
    end
  end

  def destroy
    photo = Photo.where({id: params.fetch("id")})[0]

    photo.destroy

    redirect_to "/photos", notice: "Photo deleted successfully."
  end
end
