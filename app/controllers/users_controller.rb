class UsersController < ApplicationController
  def new
    @user = User.new
  end

  

end

private
def user_params
  params.require(:user).permit(:nickname, :image, :introduction, :profile, :subject, :email)
end