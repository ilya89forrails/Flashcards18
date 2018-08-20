class CardsMailer < ApplicationMailer
  default from_email: 'info@ilya89forrails.ru'

  def pending_cards_notification(user)
    @user = user
    @email = 'ilya89forrails@gmail.com' #@user.email

    mail(to: @email, subject: 'Unreviewed cards!', from_email: 'info@ilya89forrails.ru')
  end
end
