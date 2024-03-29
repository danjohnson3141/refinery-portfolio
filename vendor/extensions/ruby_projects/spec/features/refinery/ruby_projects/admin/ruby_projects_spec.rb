# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "RubyProjects" do
    describe "Admin" do
      describe "ruby_projects" do
        refinery_login_with :refinery_user

        describe "ruby_projects list" do
          before do
            FactoryGirl.create(:ruby_project, :name => "UniqueTitleOne")
            FactoryGirl.create(:ruby_project, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.ruby_projects_admin_ruby_projects_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.ruby_projects_admin_ruby_projects_path

            click_link "Add New Ruby Project"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::RubyProjects::RubyProject.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::RubyProjects::RubyProject.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:ruby_project, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.ruby_projects_admin_ruby_projects_path

              click_link "Add New Ruby Project"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::RubyProjects::RubyProject.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:ruby_project, :name => "A name") }

          it "should succeed" do
            visit refinery.ruby_projects_admin_ruby_projects_path

            within ".actions" do
              click_link "Edit this ruby project"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:ruby_project, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.ruby_projects_admin_ruby_projects_path

            click_link "Remove this ruby project forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::RubyProjects::RubyProject.count.should == 0
          end
        end

      end
    end
  end
end
