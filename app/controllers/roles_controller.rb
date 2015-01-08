class RolesController < ApplicationController

  def role_name_search
    if params[:term].present?
      @roles = Role.where( "roles.name like ?", "%#{params[:term]}%" )
      render json: @roles
    end
  end

end
