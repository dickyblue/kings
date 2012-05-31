class UpdateMailer < ActionMailer::Base
  default from: "nicholas.khuu@gmail.com"
  
  def update_email(user)
    @user = user
    @url = "http://www.thekhuus.com"
    mail(:to => user.email, :subject => "Nick and Ming updated their website")
  end
  
end
