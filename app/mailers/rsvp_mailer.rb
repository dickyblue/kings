class RsvpMailer < ActionMailer::Base
  default from: "nicholas.khuu@gmail.com"
  
  def rsvp_email(user)
    @url = "http://www.thekhuus.com"
    @user = user
    mail(:to => user.email, :subject => "RSVP Needed for Nick and Ming's wedding")   
  end

end
