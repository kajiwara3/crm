class CreateMagazineTargets < ActiveRecord::Migration
  def change
    create_table :magazine_targets do |t|
      t.references :mail_magazine, null: false
      t.string :name
      t.string :email
      t.datetime :sent_at
      t.boolean :enabled_target, default: true

      t.timestamps
    end
  end
end
