class FormMailer < ApplicationMailer
  def new_email(formroute, amessage)
    @amessage = amessage
    mail(to: formroute.fwd_to_email, 
        subject: amessage.msg_subject)
  end
end
