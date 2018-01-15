class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :adress
      t.string :state
      t.string :zip_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
