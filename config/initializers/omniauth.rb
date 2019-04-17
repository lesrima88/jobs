Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, "123545291784621", "289c1b52690e5ce86be5cc29cf19bde0",
{
scope: 'email,public_profile,user_location,user_birthday,user_about_me',
image_size: {width: 400, height: 400},
info_fields: 'first_name,email'
}
end