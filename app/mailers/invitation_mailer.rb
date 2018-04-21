class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.send_mail.subject
  #
  def send_mail(user_to, user_from, permission, category, token)
    @greeting = "Hi " + user_to
    @user_from = user_from
    @permission = permission
    @category = category
    @token = token

    mail(to: user_to, from: @user_from.email, subject: 'Inviation Email')
  end

  def user_cred_mail(user, password)
    @greeting = "Hi user_from"
    @user = user
    @password = password

    mail(to: user.email, from: 'HelpDesk', subject: 'Credentials')
  end
end
