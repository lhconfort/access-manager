module AccessManager
  class Railtie < Rails::Railtie
    initializer "access_manager.view_helpers" do |app|
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
