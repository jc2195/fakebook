class AddColumnsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :bio, :text
    add_column :profiles, :location, :string
    add_column :profiles, :workplace, :string
    add_column :profiles, :school, :string
    add_column :profiles, :home_town, :string
    add_column :profiles, :relationship_status, :string
    add_column :profiles, :birthday, :date
  end
end
