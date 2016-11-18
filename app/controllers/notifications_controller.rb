class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def update
    @notification = Notification.find_by id: params[:id]
    @notification.update_attributes status: true
  end
end
