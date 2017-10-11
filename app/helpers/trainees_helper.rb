module TraineesHelper
  def trainee_arr_uniq object
    @trainees.to_a.pluck(object).uniq
  end
end
