require_relative '../controllers/concerns/slack'

class SlackWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(opt)
    slack = Slack.new(ENV['INQUIRY_SLACK_URL'])
    res = slack.post(opt)
  end
end
