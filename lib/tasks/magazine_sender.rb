# coding: utf-8
class Tasks::MagazineSender
  def self.execute
    #puts message
      @mail_magazine = MailMagazine.find(ENV["id"])
      MagazineMailer.magazine_sending(@mail_magazine, ENV["target"]).deliver
      puts "送信しました"
  end
end