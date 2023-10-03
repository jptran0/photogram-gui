class UsersController < ApplicationController
  def index
    render template: "users_templates/index"
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
end
