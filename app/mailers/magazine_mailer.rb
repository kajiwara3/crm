# coding: utf-8
class MagazineMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.magazine_mailer.reserved_mail.subject
  #
  def reserved_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def magazine_sending(mail_magazine, target)
    @mail_magazine = mail_magazine
    mail subject: @mail_magazine.subject,
                  to: target,
                  from: Tw::Application.config.administrator_email_address
  end
end
