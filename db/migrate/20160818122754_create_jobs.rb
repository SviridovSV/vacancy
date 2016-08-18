class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :profession
      t.string :country
      t.string :city
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
