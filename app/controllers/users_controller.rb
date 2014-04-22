class UsersController < ApplicationController
  # before_action :add_participation, only: [:index]

  def index
    # authorize! :manage, User
      @users = User.all
  end

  def authorize
    respond_to do |format|
      format.html
    end
  end

  private

end
