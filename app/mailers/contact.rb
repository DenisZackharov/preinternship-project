class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :file, attachment: true

  attribute :message
  attribute :nickname, captcha: true

  def headers
    {
      subject: "My Contact Form",
      to: "denis.zaharov@flatstack.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
