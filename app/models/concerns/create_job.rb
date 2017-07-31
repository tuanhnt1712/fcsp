module CreateJob
  def create_transaction_post_skills
    ActiveRecord::Base.transaction do
      self.save!
      return true if build_skills
      raise ActiveRecord::Rollback
    end
    rescue ActiveRecord::RecordInvalid
    return false
  end

  def update_transaction_post_skills post_params
    ActiveRecord::Base.transaction do
      update_attributes post_params
      return true if update_skills
      raise ActiveRecord::Rollback
    end
    rescue ActiveRecord::RecordInvalid
    return false
  end

  def build_skills
    return true unless list_skills.present?
    list_skills.each do |skill|
      skills << Skill.find_or_create_by!(name: skill)
    end
    rescue ActiveRecord::RecordInvalid => exception
    errors[:list_skills] << exception.message
    return false
  end

  def update_skills
    skills.delete_all
    update_new_skills
    rescue ActiveRecord::RecordInvalid => exception
    errors[:lists_skill] << exception.message
    return false
  end

  def update_new_skills
    return true unless list_skills.present?
    names = skills.pluck :name
    list_skills.each do |skill|
      skills << Skill.find_or_create_by!(name: skill) unless names.include? skill
    end
  end

  def delete_skills_if_not_exists
    skills.each do |current_skill|
      skills.delete current_skill unless list_skills.include? current_skill.name
    end
  end

  private

  def list_skills_to_array
    self.list_skills = self.list_skills.try :split, ","
  end
end
