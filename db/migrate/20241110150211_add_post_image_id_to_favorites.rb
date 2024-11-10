class AddPostImageIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :post_image, foreign_key: true
  end
end
