class MySignUpService < Monban::Services::SignUp
  def initialize(user_params)
    digested_token = token_digest(user_params)
    @user_params = user_params.
      merge(token_store_field.to_sym => digested_token)
  end

  def perform
    useable_params = @user_params.except(token_field).to_hash
    if @user_params[token_field] == @user_params[:password_confirmation]
      Monban.config.creation_method.call(useable_params)
    else
      User.new(useable_params)
    end
  end
end
