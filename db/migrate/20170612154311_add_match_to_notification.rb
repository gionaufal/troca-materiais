class AddMatchToNotification < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :match, foreign_key: true
  end
end
