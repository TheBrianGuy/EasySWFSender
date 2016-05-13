class FormMailer < ApplicationMailer
  def new_email(formroute, amessage)
    @amessage = amessage
    mail(to: formroute.fwd_to_email, 
        reply_to: amessage.msg_from_email,
        subject: amessage.msg_subject)
  end
end
