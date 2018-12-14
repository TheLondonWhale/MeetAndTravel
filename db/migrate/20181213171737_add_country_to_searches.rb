class AddCountryToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :country, :string
  end
end
