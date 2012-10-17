class CreateMailMagazines < ActiveRecord::Migration
  def change
    create_table :mail_magazines do |t|
      t.string :subject
      t.string :body
      t.datetime :reserved_at
      t.datetime :sent_at
      t.datetime :canceled_at

      t.timestamps
    end
  end
end
