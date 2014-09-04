
FactoryGirl.define do
  factory :ruby_project, :class => Refinery::RubyProjects::RubyProject do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

