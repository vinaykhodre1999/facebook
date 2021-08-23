class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :dob
      t.string :address

      t.timestamps
    end
  end
end
