class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :email
      t.string :website_url
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
