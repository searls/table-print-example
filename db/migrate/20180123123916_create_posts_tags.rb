class CreatePostsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :posts_tags do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
