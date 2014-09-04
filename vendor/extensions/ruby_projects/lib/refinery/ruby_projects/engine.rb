module Refinery
  module RubyProjects
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::RubyProjects

      engine_name :refinery_ruby_projects

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "ruby_projects"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.ruby_projects_admin_ruby_projects_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/ruby_projects/ruby_project',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::RubyProjects)
      end
    end
  end
end
