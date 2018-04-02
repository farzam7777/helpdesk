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
Rails.application.config.assets.precompile += %w( css/plugins.min.css )
Rails.application.config.assets.precompile += %w( css/responsive-style.css )
Rails.application.config.assets.precompile += %w( css/colors/color-1.css )
Rails.application.config.assets.precompile += %w( media/audio.mp3 )
Rails.application.config.assets.precompile += %w( js/main.js )
Rails.application.config.assets.precompile += %w( js/plugins.min.js )
Rails.application.config.assets.precompile += %w( js/color-switcher.min.js )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont3e6e.eot )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont3e6e.html )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont3e6e.svg )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont3e6e.ttf )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont3e6e.woff )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfontd41d.eot )
Rails.application.config.assets.precompile += %w( fonts/glyphicons-halflings-regular.eot )
Rails.application.config.assets.precompile += %w( fonts/glyphicons-halflings-regular.html )
Rails.application.config.assets.precompile += %w( fonts/glyphicons-halflings-regular.svg )
Rails.application.config.assets.precompile += %w( fonts/glyphicons-halflings-regular.ttf )
Rails.application.config.assets.precompile += %w( fonts/glyphicons-halflings-regular.woff )
Rails.application.config.assets.precompile += %w( fonts/glyphicons-halflings-regulard41d.eot )

