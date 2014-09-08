class AddTaggingsCountToBlogPosts < ActiveRecord::Migration
  def change
    add_column :refinery_blog_posts, :taggings_count, :integer
  end
end
