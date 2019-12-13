class UsersController < ApplicationController
def profile
  @user = current_user
end

private
  def user_params
  params.require(:user).permit(:email, :photo)
end
end
