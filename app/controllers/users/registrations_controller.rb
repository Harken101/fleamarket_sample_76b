# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  def create
    session[:user] = user_params
    @user = User.new(session[:user])
    unless @user.valid?
      render :new and return
    end
    @address = @user.build_address #userモデルとaddressesモデルの関連付け。
    render :new_address
  end

  def create_address
    @user = User.new(session[:user])  # ここでuserモデルのsessionを引数で渡す。
    @address = Address.new(address_params)# 今回のビューで入力された情報を代入。


    unless @address.valid?
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    session[:user].clear
    sign_in(:user, @user)
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

    def address_params
      params.require(:address).permit(
        :family_name, :first_name, :furigana_family_name, :furigana_first_name, :prefecture, :zipcode, :city, :street, :mansion, :tell)
    end

end
