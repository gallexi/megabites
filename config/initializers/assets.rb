# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( paper-toolbar/paper-toolbar.html )
Rails.application.config.assets.precompile += %w( paper-button/paper-button.html )
Rails.application.config.assets.precompile += %w( paper-icon-button/paper-icon-button.html )
Rails.application.config.assets.precompile += %w( paper-material/paper-material.html )
Rails.application.config.assets.precompile += %w( paper-input/paper-input.html )

Rails.application.config.assets.precompile += %w( iron-icon/iron-icon.html )
Rails.application.config.assets.precompile += %w( iron-icons/iron-icons.html )
Rails.application.config.assets.precompile += %w( iron-iconset-svg/iron-iconset-svg.html )
Rails.application.config.assets.precompile += %w( iron-iconset/iron-iconset.html )
Rails.application.config.assets.precompile += %w( iron-flex-layout/iron-flex-layout.html )
Rails.application.config.assets.precompile += %w( iron-flex-layout/iron-flex-layout-classes.html )

