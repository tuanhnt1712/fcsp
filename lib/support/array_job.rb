class ArrayJob
  class << self
    def get_job job_object, user_object
      job_object.select do |job|
        user_object.present?
      end
    end
  end
end
