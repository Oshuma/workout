class CreateSettings < ActiveRecord::Migration[5.2]
  def up
    create_table :settings do |t|
      t.references :user, foreign_key: true
      t.boolean :rest_timer, default: true
      t.integer :rest_timer_interval, default: 30

      t.timestamps
    end

    say_with_time("Creating Settings for all Users") do
      User.find_each { |user| user.create_settings! }
    end
  end

  def down
    drop_table :settings
  end
end
