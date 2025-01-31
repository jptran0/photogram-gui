class UsersController < ApplicationController
  def index
    @users = User.order({ username: :asc })
    render template: "users/index"
  end

  def show
    @user = User.where({username: params.fetch("username")})[0]
    render template: "users/show"
  end

  def create
    user = User.new
    user.username = params.fetch("username")
    
    if user.valid?
      user.save
      redirect_to "/users/#{user.username}", {notice: "User added successfully."}
    else
      redirect_to "/users", {alert: user.errors.full_messages.to_sentence}
    end
  end

  def update
    user = User.where({id: params.fetch("id")})[0]

    user.username = params.fetch("username")

    if user.valid?
      user.save
      redirect_to "/users/#{user.username}", notice: "Username updated successfully."
    else
      redirect_to "/users/#{user.username}", alert: user.errors.full_messages.to_sentence
    end
  end
end
