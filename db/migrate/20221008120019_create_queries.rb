class CreateQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :queries do |t|

      t.timestamps
    end
  end
end
