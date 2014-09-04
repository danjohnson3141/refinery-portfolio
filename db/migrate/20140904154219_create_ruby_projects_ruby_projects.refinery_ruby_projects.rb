# This migration comes from refinery_ruby_projects (originally 1)
class CreateRubyProjectsRubyProjects < ActiveRecord::Migration

  def up
    create_table :refinery_ruby_projects do |t|
      t.string :name
      t.text :description
      t.integer :screenshot_id
      t.boolean :complete
      t.date :created_on
      t.date :updated_on
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-ruby_projects"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/ruby_projects/ruby_projects"})
    end

    drop_table :refinery_ruby_projects

  end

end
