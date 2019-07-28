class RemoveRestTimerIntervalFromSettings < ActiveRecord::Migration[5.2]
  def change
    remove_column :settings, :rest_timer_interval, :integer, default: 30
  end
end
