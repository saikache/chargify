
  require 'chargify_api_ares'

  Chargify.configure do |c|
    c.api_key   = "YOUR-API-ACCESS-KEY"
    c.site      = "https://YOUR-USER-NAME.chargify.com/"
  end