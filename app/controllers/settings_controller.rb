class SettingsController < ApplicationController

  def index
    @settings = current_user.settings
  end

  def update
    @settings = current_user.settings

    if @settings.update(settings_params)
      redirect_to settings_path, notice: 'Settings saved.'
    else
      redirect_to settings_path, alert: 'Could not save settings.'
    end
  end

  private

  def settings_params
    params.require(:settings).permit(
      :rest_timer,
      :rest_timer_interval,
    )
  end

end
