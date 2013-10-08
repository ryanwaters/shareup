class Users::UsersControllers < Devise::SessionsController
  respond_to :json

  def is_user
    reject_if_not_authorized_request!
    render status: 200,
      json: {
        success: !User.find_by_name(params[:name]).blank?
      }
  end

  private

  def reject_if_not_authorized_request!
    warden.authenticate!(
      scope: resource_name,
      recall: "#{controller_path}#failure")
  end

end