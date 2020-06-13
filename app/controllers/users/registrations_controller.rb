# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  def create
    session[:user_params_after_step1] = user_params
    @user = User.new(session[:user_params_after_step1])
    unless @user.valid?(:validates_step1)
      render :new and return
    end
    # binding.pry
    @user = User.new
    render :new_user2


  end

  def new_user2
    session[:user_params_after_step2] = user_params
    
    session[:user_params_after_step2].merge!(session[:user_params_after_step1])
    @user = User.new(session[:user_params_after_step2])
    @user.build_address(session[:address_attributes])
    unless @user.valid?(:validates_step2)
      render :new and return
    end
    @user = User.new
    @user.build_address #userモデルとaddressesモデルの関連付け。
    render :new_address
    # binding.pry
  end

  def create_address
    @user = User.new(session[:user_params_after_step2])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_address(user_params[:address_attributes])# 今回のビューで入力された情報を代入。

    if @user.build_address(user_params[:address_attributes]).valid?(:validates_step3)
      @user.save
      session[:id] = @user.id  #ここでidをsessionに入れることでログイン状態に持っていける。
      sign_in User.find(session[:id])
      redirect_to root_path
    else
      # render '/signup/step3'
    end
  end


  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  protected
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
      address_attributes: [:id, :family_name, :first_name, :furigana_family_name, :furigana_first_name,
        :prefecture, :zipcode, :city, :street, :mansion, :tell]
    )
  end
end
