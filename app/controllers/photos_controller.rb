class PhotosController < ApplicationController
  def index
    render template: "photos/index"
  end
end
