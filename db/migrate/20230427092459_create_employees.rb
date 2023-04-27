class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.string :email
      t.string :password
      t.integer :gender
      t.integer :hobbies, array: true, default: []
      t.text :address
      t.bigint :mobile_number
      t.date :birth_date
      t.string :document

      t.timestamps
    end
  end
end
