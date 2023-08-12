class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    user = User.from_omniauth(request.env['omniauth.auth'])

    if user.present?
      sign_in_and_redirect user, event: :authentication
    else
      redirect_to new_user_session_path
    end
  end
end