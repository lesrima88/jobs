class ActionMailer::Base
  def perform_caching
    Rails.configuration.action_controller.perform_caching
  end
  def controller_name
    "ActionMailer" # anything, really
  end
end