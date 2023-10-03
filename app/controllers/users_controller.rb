class UsersController < ApplicationController
  def index
    render template: "users_templates/index"
  end

  def show
    @user = User.where({username: params.fetch("username")})[0]
    render template: "users_templates/show"
  end

  def create
    @user = User.new
    @user.username = params.fetch("username")
    
    if @user.valid?
      @user.save
      redirect_to "/users", {:notice => "User added successfully."}
    else
      redirect_to "/users", {:alert => @user.errors.full_messages.to_sentence}
    end
  end

  def update
    @user = User.where({id: params.fetch("user_id")})[0]

    @user.username = params.fetch("username")

    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.username}", {:notice => "Username updated successfully."}
    else
      redirect_to "/users/#{@user.username}", {:alert => @user.errors.full_messages.to_sentence}
    end
  end
end
