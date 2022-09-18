class ApplicationMailer < ActionMailer::Base
  # ↓　メールの送り主の名前
  default from: "花広場<from@example.com>"
  layout 'mailer'
end
