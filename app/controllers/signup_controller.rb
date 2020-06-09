class SignupController < ApplicationController
    before_action :save_step1_to_session, only: :step2
    before_action :save_step2_to_session, only: :step3
  
    def step1
      @user = User.new
    end
  
    # 以下バリデーション
    def save_step1_to_session
      session[:user_params_after_step1] = user_params
      @user = User.new(session[:user_params_after_step1])
      render '/signup/step1' unless @user.valid?(:validates_step1)
    end 
  
    def step2
      @user = User.new
    end
  
    # 以下バリデーション
    def save_step2_to_session
    session[:user_params_after_step2] = user_params

    session[:user_params_after_step2].merge!(session[:user_params_after_step1])
    @user = User.new(session[:user_params_after_step2])
    @user.build_address(session[:address_attributes])
    render '/signup/step2' unless @user.valid?(:validates_step2)
  end
  
  def step3
    @user = User.new
    @user.build_address #userモデルとaddressesモデルの関連付け。
  end
  
  def complete_signup
    @user = User.new(session[:user_params_after_step2])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_address(user_params[:address_attributes])# 今回のビューで入力された情報を代入。

    if @user.build_address(user_params[:address_attributes]).valid?(:validates_step3)
      @user.save
      session[:id] = @user.id  #ここでidをsessionに入れることでログイン状態に持っていける。
      sign_in User.find(session[:id])
      redirect_to root_path
    else
      render '/signup/step3'
    end
  end
end

private
def user_params
  params.require(:user).permit(
    :nickname,
    :email,
    :password, 
    :password_confirmation,
    :family_name,
    :first_name,
    :furigana_family_name,
    :furigana_first_name,
    :birthday,
    address_attributes: [:id, :family_name, :first_name, :furigana_family_name, :furigana_first_name,:prefecture, :zipcode, :city, :street, :mansion, :tell]
  )
end