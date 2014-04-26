require 'access_manager/control'
require 'access_manager/version'

if defined? (Rails)
  require 'access_manager/view_helpers'
  require 'access_manager/railtie'

  if Gem::Requirement.new('>= 3.1').satisfied_by?(Gem::Version.new(Rails.version))
    require 'access_manager/engine'
  end
end

