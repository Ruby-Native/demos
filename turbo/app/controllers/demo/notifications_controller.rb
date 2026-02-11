module Demo
  class NotificationsController < ApplicationController
    def new
      @devices = current_user.push_devices
      @page_title = "Send notification"
    end

    def create
      @devices = current_user.push_devices

      if @devices.none?
        flash.now.alert = "No devices registered. Open the app and grant push permission first."
        @page_title = "Send notification"
        return render :new, status: :unprocessable_entity
      end

      notification = ApplicationPushNotification
        .with_data(path: params[:path])
        .new(title: params[:title], body: params[:body])

      notification.deliver_later_to(@devices.to_a)

      redirect_to new_demo_notification_path, notice: "Notification sent to #{helpers.pluralize(@devices.count, "device")}."
    end
  end
end
