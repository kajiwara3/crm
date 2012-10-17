class CreateMagazineTargets < ActiveRecord::Migration
  def change
    create_table :magazine_targets do |t|
      t.references :mail_magazine, null: false
      t.string :name
      t.text :email
      t.datetime :sent_at
      t.boolean :validity, default: true

      t.timestamps
    end
  end
end
