Monban.configure do |config|
  config.user_lookup_field = :username
  config.sign_up_service = MySignUpService
  config.authentication_service = MyAuthentication
end
