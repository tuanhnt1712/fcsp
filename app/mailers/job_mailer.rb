class JobMailer < ApplicationMailer
  def apply_job user, job
    @user = user
    @job = job
    mail to: user.email,
      subject: t(".subject", name: user.name)
  end

  def posting_job employer, job
    @employer = employer
    @job = job
    mail to: employer.email,
      subject: t(".subject", job_title: job.title)
  end
end
