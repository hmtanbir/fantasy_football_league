# config/initializers/locales.rb

# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('lib', 'locales', '*.{rb,yml}')]

# Permitted locales available for the application
I18n.available_locales = [:en, :jp]

# Set default locales to something other than :en
I18n.default_locale = :en
