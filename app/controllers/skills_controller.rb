class SkillsController < ApplicationController
  def index
    @skills = Skill.search(name_cont: params[:name]).result
      .limit Settings.school.per_search
    render json: @skills
  end
end
