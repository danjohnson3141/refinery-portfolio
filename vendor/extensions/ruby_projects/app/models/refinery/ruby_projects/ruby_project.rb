module Refinery
  module RubyProjects
    class RubyProject < Refinery::Core::BaseModel
      self.table_name = 'refinery_ruby_projects'

      attr_accessible :name, :description, :screenshot_id, :complete, :created_on, :updated_on, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :screenshot, :class_name => '::Refinery::Image'
    end
  end
end
