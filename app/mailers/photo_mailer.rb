class PhotoMailer < ActionMailer::Base
  default from: "nicholas.khuu@gmail.com"
  
  def photo_email(user)
    @url = "http://www.thekhuus.com"
    @user = user
    mail(:to => user.email, :subject => "Photos for Nick and Ming's wedding")   
  end
end
