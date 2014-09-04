module Refinery
  module RubyProjects
    class RubyProjectsController < ::ApplicationController

      before_filter :find_all_ruby_projects
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @ruby_project in the line below:
        present(@page)
      end

      def show
        @ruby_project = RubyProject.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @ruby_project in the line below:
        present(@page)
      end

    protected

      def find_all_ruby_projects
        @ruby_projects = RubyProject.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/ruby_projects").first
      end

    end
  end
end
