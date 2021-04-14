# OmniAuth TikTok (Marketing API) OAuth2 Strategy
Strategy to authenticate with TikTok (Marketing API) via OAuth2 in OmniAuth

Sign up and create your Application at https://ads.tiktok.com/i18n/login.  Note the App ID and the App Secret.

For more details, read the docs: https://ads.tiktok.com/marketing_api/docs?rid=1dmrkuztuhi&id=100510

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-tiktok-oauth2'
```

Then `bundle install`.

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tiktok_oauth2, ENV['TIKTOK_APP_ID'], ENV['TIKTOK_SECRET']
end
```

You can now access the OmniAuth TikTok OAuth2 URL: `/auth/tiktok_oauth2`

## Configuration

* `name`: The name of the strategy. The default name is `tiktok_oauth2` but it can be changed to any value, for example `tiktok`. The OmniAuth URL will thus change to `/auth/tiktok` and the `provider` key in the auth hash will then return `tiktok`.
