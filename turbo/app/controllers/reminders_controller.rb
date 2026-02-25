class RemindersController < ApplicationController
  def create
    link = current_user.links.find(params[:link_id])
    reminder = Reminder.create!(link: link, user: current_user, send_at: 5.seconds.from_now)
    SendReminderJob.set(wait_until: reminder.send_at).perform_later(reminder)
    redirect_to link, notice: native_app? ? nil : "Reminder set!"
  end
end
