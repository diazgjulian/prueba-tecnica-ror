class AddMailToQuery < ActiveRecord::Migration[7.0]
  def change
    add_column :queries, :email, :string
  end
end
