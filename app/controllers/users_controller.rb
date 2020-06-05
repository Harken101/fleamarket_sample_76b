class UsersController < ApplicationController
  def new
    USER.new
  end

  

end

private
def user_params
  params.require(:user).permit(:nickname, :image, :introduction, :profile, :subject, :email)
end