class CreateMagazineTargets < ActiveRecord::Migration
  def change
    create_table :magazine_targets do |t|
      t.references :mail_magazine, null: false
      t.string :name
      t.text :email
      t.date :send_date
      t.boolean :validity, default: true

      t.timestamps
    end
  end
end
