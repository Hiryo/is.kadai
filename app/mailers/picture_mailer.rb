class PictureMailer < ApplicationMailer
  def picture_mail(blog)
    @blog = blog
    mail to: "rih60909@gmail.com", subject: "Confirmation of post mail"
  end
end
