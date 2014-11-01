require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YasubeeFriends
  class Application < Rails::Application
    config.time_zone = 'Tokyo' # タイムゾーンを Tokyo に変更
    config.i18n.default_locale = :ja # 言語を日本語に変更 
    config.autoload_paths += %W(#{config.root}/lib)
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
