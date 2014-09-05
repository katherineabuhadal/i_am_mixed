class MyAuthentication < Monban::Services::Authentication
  def initialize(user, undigested_token)
    @user = user
    @undigested_token = undigested_token
  end

  def perform
    if authenticated?
      @user
    else
      false
    end
  end

  private

  def authenticated?
    @user && @user.confirmed == true && Monban.compare_token(@user.send(token_store_field), @undigested_token)
  end
end
