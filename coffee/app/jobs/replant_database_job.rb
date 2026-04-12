class ReplantDatabaseJob < ApplicationJob
  def perform
    tables = ActiveRecord::Base.connection.tables - %w[schema_migrations ar_internal_metadata solid_queue_processes solid_queue_ready_executions solid_queue_scheduled_executions solid_queue_recurring_executions solid_queue_recurring_tasks solid_queue_semaphores solid_queue_blocked_executions solid_queue_claimed_executions solid_queue_jobs solid_queue_pauses solid_cable_messages]

    ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = OFF")
    ActiveRecord::Base.transaction do
      tables.each { |table| ActiveRecord::Base.connection.execute("DELETE FROM #{table}") }
    end
    ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON")

    Rails.application.load_seed
  end
end
