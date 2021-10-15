class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :shop_name
      t.string :shop_category
      t.string :area_name
      t.string :product_category
      t.text :comment

      t.timestamps
    end
  end
end
