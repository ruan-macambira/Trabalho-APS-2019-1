class UsersController < ApplicationController
  def index
    set_roles
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(5)
  end

  def profile
  end

  private

  def set_roles
    @roles = ['admin', 'professor', 'student'].each_with_index.map { |aux, i|
      [I18n.t(aux, scope: [:activerecord, :enums, :user, :role]), i]
    }
  end
end
