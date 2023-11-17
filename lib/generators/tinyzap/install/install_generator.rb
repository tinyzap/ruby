class TinyZap::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def include_controller_helper
    inject_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::Base\n" do <<-'RUBY'
  include TinyZap::OpenGraph

    RUBY
    end
  end

  def copy_layout
    copy_file "application.opengraph.erb", "app/views/layouts/application.opengraph.erb"
  end

  def copy_configuration_file
    template "tinyzap.rb.tt", "config/initializers/tinyzap.rb"
  end
end
