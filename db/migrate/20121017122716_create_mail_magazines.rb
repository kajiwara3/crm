class CreateMailMagazines < ActiveRecord::Migration
  def change
    create_table :mail_magazines do |t|
      t.string :subject
      t.text :body
      t.datetime :reserved_at
      t.datetime :start_sending_at
      t.datetime :complete_sending_at
      t.datetime :canceled_at

      t.timestamps
    end
  end
end
