CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['AUDICLE_KEY'],
    :aws_secret_access_key => ENV['AUDICLE_SECRET']
  }

  config.fog_directory = 'audicle'
  config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku
end
