# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( css/custom.css )
Rails.application.config.assets.precompile += %w( css/style.css )
Rails.application.config.assets.precompile += %w( css/plugins.min.css )
Rails.application.config.assets.precompile += %w( css/responsive-style.css )
Rails.application.config.assets.precompile += %w( css/bootstrap-social.css )
Rails.application.config.assets.precompile += %w( media/audio.mp3 )
Rails.application.config.assets.precompile += %w( js/main.js )
Rails.application.config.assets.precompile += %w( js/plugins.min.js )
Rails.application.config.assets.precompile += %w( js/color-switcher.min.js )

