class AssignsController < ApplicationController
  include TeamHelper
  before_action :authenticate_user!

  def create
    team = Team.friendly.find(params[:team_id])
    user = email_reliable?(assign_params) ? User.find_or_create_by_email(assign_params) : nil
    if user
      team.invite_member(user)
      redirect_to team_url(team), notice: I18n.t('views.messages.assigned')
    else
      redirect_to team_url(team), notice: I18n.t('views.messages.failed_to_assign')
    end
  end

  def destroy
    assign = Assign.find(params[:id])
    # destroy_message = assign_destroy(assign, assign.user)
    # redirect_to team_url(params[:team_id]), notice: destroy_message

    assign.destroy
    #AssignMailer.assign_mail(assign.user.email, assign.user.password).deliver
    redirect_to dashboard_url, notice:" user deleted successfully"

end
  private

  def assign_params
    params[:email]
  end
  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
  
  def set_next_team(assign, assigned_user)
    another_team = Assign.find_by(user_id: assigned_user.id).team
    change_keep_team(assigned_user, another_team) if assigned_user.keep_team_id == assign.team_id
  end
end
