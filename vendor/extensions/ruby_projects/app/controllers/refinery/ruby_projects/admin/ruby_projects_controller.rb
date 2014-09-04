module Refinery
  module RubyProjects
    module Admin
      class RubyProjectsController < ::Refinery::AdminController

        crudify :'refinery/ruby_projects/ruby_project',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
