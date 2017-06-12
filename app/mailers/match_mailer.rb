class MatchMailer < ApplicationMailer
  default from: 'email@trocamateriais.com'

  def match_email(match)
    @user     = match.wish.user
    @notifier = match.material.user
    @url      = match_url(match)
    mail(to: @user.email, subject: "Nova proposta de troca de #{notifier.name}")
  end
end
