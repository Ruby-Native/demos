class SendReminderJob < ApplicationJob
  def perform(reminder)
    devices = reminder.user.push_devices
    return if devices.none?

    ApplicationPushNotification
      .with_data(path: "/links/#{reminder.link_id}")
      .new(title: reminder.link.title, body: "Time to read this!")
      .deliver_later_to(devices.to_a)

    reminder.destroy!
  end
end
