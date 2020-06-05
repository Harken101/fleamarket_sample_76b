class ApplicationController < ActionController::Base
  #deviseコントローラーが動くとconfigure_permitted_parametersを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

# 以下デプロイのために追記
  before_action :basic_auth, if: :production?

  private
  #sign up時に以下のカラムも登録ができる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:first_name,:furigana_family_name,:furigana_first_name, :birthday])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end
