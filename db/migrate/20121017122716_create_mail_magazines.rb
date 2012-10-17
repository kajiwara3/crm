class CreateMailMagazines < ActiveRecord::Migration
  def change
    create_table :mail_magazines do |t|
      t.string :subject
      t.string :body
      t.date :reserved_date
      t.date :send_date
      t.date :canceled_date

      t.timestamps
    end
  end
end
