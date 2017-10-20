class BookmarksController < ApplicationController
  load_resource :job, parent: false, only: %i(create destroy)

  def create
    current_user.bookmark @job
  end

  def destroy
    current_user.unbookmark @job
  end
end
