class AddElementsToQuery < ActiveRecord::Migration[7.0]
  def change
    add_column :queries, :query, :string
    add_column :queries, :results, :string, array: true
  end
end
