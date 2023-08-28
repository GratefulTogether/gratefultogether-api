class UsersControllers < ApplicationController
  def index
    users = User.all
  end
end