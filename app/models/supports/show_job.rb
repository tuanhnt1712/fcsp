module Supports
  class ShowJob
    attr_reader :job, :company, :team_introduction,
      :hiring_types, :published_date, :qualified_profile

    # delegate :benefits, :founder_on, to: :company, prefix: true

    def initialize job, user
      @job = job
      @user = user
    end

    def company
      @job.company
    end

    def members
      company.users
    end

    def has_member?
      company.users.try :any?
    end

    def company_address
      company.addresses
    end

    def job_skills
      @job.skills
    end

    def published_date
      @job.created_at.to_date
    end

    def recommend
      User.recommend @job
    end

    def qualified_profile?
      requests = JSON.parse(@job.profile_requests).to_a
      (education? requests) && (portfolio? requests) && (introduce? requests) &&
        (requests.exclude?("ambition") || @user.info_user_ambition.present?)
    end

    def can_apply_job?
      return true if @job.everyone?

      if @job.friends_of_friends_of_member?
        return is_friend_of_friends_of_member?
      end
    end

    private

    def education? requests
      requests.exclude?("user_educations") || @user.user_educations.any?
    end

    def portfolio? requests
      requests.exclude?("user_portfolios") || @user.user_portfolios.any?
    end

    def introduce? requests
      requests.exclude?("introduce") || @user.info_user_introduce.present?
    end

    def is_friend_of_friends_of_member?
      friends_of_member.any?{|member| member.friends.any?(&friend_block)}
    end

    def friends_of_member
      company.users.joins(:friends).where.not(id: @user.id)
        .includes :friends, :friendships
    end

    def friend_block
      proc{|user| user.friends_with? @user}
    end
  end
end
