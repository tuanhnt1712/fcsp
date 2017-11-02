module TraineesHelper
  def trainee_arr_uniq object
    @trainees.pluck(object).uniq
  end
end
