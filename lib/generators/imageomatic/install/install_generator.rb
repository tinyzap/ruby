class Imageomatic::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def include_controller_helper
    inject_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::Base\n" do <<-'RUBY'
  include Imageomatic::Opengraph

    RUBY
    end
  end

  def copy_layout
    copy_file "application.opengraph.erb", "app/views/layouts/application.opengraph.erb"
  end
end
