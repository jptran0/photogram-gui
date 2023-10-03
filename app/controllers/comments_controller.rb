class CommentsController < ApplicationController
  def create
    comment = Comment.new

    comment.photo_id = params.fetch("photo_id")
    comment.author_id = params.fetch("author_id")
    comment.body = params.fetch("comment")

    if comment.valid?
      comment.save
      redirect_to "/photos/#{comment.photo_id}", notice: "Comment added successfully."
    else
      redirect_to "/photos/#{comment.photo_id}", alert: comment.errors.full_messages.to_sentence
    end
  end
end
