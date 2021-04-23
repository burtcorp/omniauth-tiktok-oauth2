require 'oauth2'
require 'omniauth/strategies/oauth2'

OAuth2::Response.register_parser(:tiktok, []) do |body|
  JSON.parse(body).fetch('data') rescue body
end

module OmniAuth
  module Strategies
    class TiktokOauth2 < OmniAuth::Strategies::OAuth2
      USER_INFO_URL = 'https://ads.tiktok.com/open_api/v1.2/user/info/'
      option :name, "tiktok_oauth2"
      option :client_options,
             site: 'https://ads.tiktok.com',
             authorize_url: 'https://ads.tiktok.com/marketing_api/auth',
             token_url: 'https://ads.tiktok.com/open_api/v1.2/oauth2/access_token'

      option :pkce, true

      def authorize_params
        super.tap do |params|
          params[:app_id] = options.client_id
        end
      end

      uid{ raw_info['id'] }

      info do
        {
          email: raw_info['email'],
          name: raw_info['display_name'],
          id: raw_info['id'],
          create_time: raw_info['create_time'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      # Remove params as callback URL must match exactly the URL defined for the application
      def callback_url
        super.split('?').first
      end

      def token_params
        options.token_params.merge(
          app_id: options.client_id,
          secret: options.client_secret,
          auth_code: request.params["code"],
          parse: :tiktok,
        )
      end

      def raw_info
        @raw_info ||= access_token.get(USER_INFO_URL, headers: headers, parse: :tiktok).parsed
      end

      def headers
        {
          'Access-Token' => access_token.token,
        }
      end
    end
  end
end
