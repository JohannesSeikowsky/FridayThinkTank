class RemoveUnnecessaryThingsFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :name, :string
    remove_column :profiles, :image_url, :string
    remove_column :profiles, :website_url, :string
    remove_column :profiles, :email, :string
  end
end
