class OffToMarry < ActionMailer::Base

  default from: "nicholas.khuu@gmail.com"
  
  def off_to_marry_email(user)
    @url = "http://www.thekhuus.com"
    @user = user
    mail(:to => user.email, :subject => "We're off to get married!")   
  end

end
