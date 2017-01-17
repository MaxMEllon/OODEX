require 'net/http'

class Slack
  def initialize(url)
    @url = url
    @default_options = {
      channel: '#general',
      username: 'TEE-bot',
      icon_emoji: ':tea:'
    }.freeze
  end

  def post(args)
    options = @default_options.merge(args)
    uri = URI.parse(@url)
    Net::HTTP.post_form(uri, payload: options)
  end
end
