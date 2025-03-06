class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy, :assign_permissions, :update_permissions]

  # Other actions (index, new, create, edit, update, destroy)...

def index
    @roles = Role.all # Fetch all roles from the database
  end


  def assign_permissions
    # This action renders the form to assign permissions
  end

  def update_permissions
    # This action updates the permissions for the role
    if @role.update(role_params)
      redirect_to roles_path, notice: 'Permissions updated successfully.'
    else
      render :assign_permissions
    end
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(permission_ids: [])
  end
end
