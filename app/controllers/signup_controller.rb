class SignupController < ApplicationController
  def step1
    @user = User.new
    # @user.build_profile #userモデルとprofileモデルの関連付け。
  end
  
  def step2
    session[:user_params] = user_params  #userモデルの値をぶっこむ。
    # session[:profile_attributes_after_step1] = user_params[:profile_attributes]  # profileモデルの値をぶっこむ。
    @user = User.new
    # @user.build_profile
  end

  

end

private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation, 
      profile_attributes: [:id, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day]
    )
  end
end