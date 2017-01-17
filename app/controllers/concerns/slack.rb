require 'net/http'
require 'slack/incoming/webhooks'

module TEE
  class Slacker
    def initialize(url, channel)
      @url = url
      @channel = channel
    end

    def post(attachments)
      slack = Slack::Incoming::Webhooks.new(
        @url,
        channel: @channel,
        username: 'TEE-system',
        icon_emoji: ':tea:'
      )
      unless attachments.nil?
        slack.post 'システムからの通知です', attachments: attachments
      end
    end
  end
end
