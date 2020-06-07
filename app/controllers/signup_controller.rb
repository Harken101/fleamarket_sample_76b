class SignupController < ApplicationController
    before_action :save_step1_to_session, only: :step2
    before_action :save_step2_to_session, only: :step3
  
    def step1
      @user = User.new
      # @user.build_address
    end
  
    # 以下バリデーション
    def save_step1_to_session
      session[:user_params_after_step1] = user_params
      @user = User.new(session[:user_params])
      # render '/signup/step1' unless @user.valid?
    end 
  
    def step2
      # session[:user_params_after_step1] = user_params  #userモデルの値をぶっこむ。
      @user = User.new
    end
  
    # 以下バリデーション
    def save_step2_to_session
    session[:user_params_after_step2] = user_params
    session[:user_params_after_step2].merge!(session[:user_params_after_step1])
    @user = User.new
    @user.build_address(session[:address_attributes])
    # render '/signup/step2' unless @user.valid?
  end
  
  def step3
    @user = User.new
    # session[:user_params_after_step2] = user_params  #userモデルの値をぶっこむ。
    # session[:user_params_after_step2].merge!(session[:user_params_attributes_after_step1])  # step2のsessionにstep1のsessionの中身を合わせる。
    @user.build_address #userモデルとaddressesモデルの関連付け。
  end
  
  def complete_signup
    @user = User.new(session[:user_params_after_step2])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_address(user_params[:address_attributes])  # 今回のビューで入力された情報を代入。
    # User.create(session[:user_params_after_step2])
    # Address.create(user_params[:address_attributes])
    if @user.save
      # binding.pry
      session[:id] = @user.id  #ここでidをsessionに入れることでログイン状態に持っていける。
      # redirect_to root_path
      redirect_to complete_signup_signup_index_path
    else
      render '/signup/step1'
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



# def step1
#   @user = User.new # 新規インスタンス作成
# end

# def step2
#   # step1で入力された値をsessionに保存
#   session[:nickname] = user_params[:nickname]
#   session[:email] = user_params[:email]
#   session[:password] = user_params[:password]
#   session[:password_confirmation] = user_params[:password_confirmation]
#   @user = User.new # 新規インスタンス作成
# end

# # def step3
# #   # step2で入力された値をsessionに保存
# #   session[:family_name] = user_params[:family_name]
# #   session[:first_name] = user_params[:first_name]
# #   session[:furigana_family_name] = user_params[:furigana_family_name]
# #   session[:furigana_first_name] = user_params[:furigana_first_name]
# #   session[:birthday] = user_params[:birthday]
# #   @user = User.new # 新規インスタンス作成
# # end

# def create
#   @user = User.new(
#     nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
#     email: session[:email],
#     password: session[:password],
#     password_confirmation: session[:password_confirmation],
#     family_name: session[:family_name], 
#     first_name: session[:first_name], 
#     furigana_family_name: session[:furigana_family_name], 
#     furigana_first_name: session[:furigana_first_name], 
#     birthday: session[:birthday]
#   )
#   if @user.save
#     # ログインするための情報を保管
#     session[:id] = @user.id
#     redirect_to complete_signup_signup_index_path
#   else
#     render '/signup/step1'
#   end
# end