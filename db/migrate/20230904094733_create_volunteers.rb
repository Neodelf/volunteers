class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :insurance_carrier
      t.string :medical_record_id

      t.timestamps
    end
  end
end
