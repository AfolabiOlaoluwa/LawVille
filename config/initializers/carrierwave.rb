require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.dropbox_app_key = ENV['app_key']
  config.dropbox_app_secret = ENV['app_secret']
  config.dropbox_access_token = ENV['access_token']
  config.dropbox_access_token_secret = ENV['access_token_secret']
  config.dropbox_user_id = ENV['user_id']
  config.dropbox_access_type = 'app_folder'
end