class Reminder < ApplicationRecord
  belongs_to :link
  belongs_to :user
end
