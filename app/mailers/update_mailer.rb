class UpdateMailer < ActionMailer::Base
  default from: "nicholas.khuu@gmail.com"
  
  def update_email(user)
    @url = "http://www.thekhuus.com"
    @weekend = "http://www.thekhuus.com/weekend_schedule"
    @user = user
    mail(:to => user.email, :subject => "Nick and Ming updated their website")   
  end
  
end
