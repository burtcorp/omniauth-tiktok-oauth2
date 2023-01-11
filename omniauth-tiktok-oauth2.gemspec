require_relative 'lib/omniauth-tiktok-oauth2/version'

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-tiktok-oauth2'
  gem.version       = OmniAuthTiktokOauth2::VERSION
  gem.license       = 'MIT'
  gem.summary       = %(A TikTok Marketing API OAuth2 strategy for OmniAuth)
  gem.description   = %(A TikTok Marketing API OAuth2 strategy for OmniAuth. This allows you to login with TikTok in your ruby app.)
  gem.authors       = ['Kristoffer Ek']
  gem.homepage      = 'https://github.com/kristofferek/omniauth-tiktok-oauth2'

  gem.files         = `git ls-files`.split("\n")
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.8'
  gem.add_runtime_dependency 'oauth2', '>= 2.0.7'
end
