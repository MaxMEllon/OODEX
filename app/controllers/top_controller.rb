require_relative './concerns/slack'

class TopController < ApplicationController
  def index
  end

  def inquiry
  end

  def post_inquiry
    content = params['content']
    opt = generate_attachment_of_slack(content)
    SlackWorker.perform_async(opt)
    redirect_to action: :index
  end

  private

  def generate_attachment_of_slack(content)
    {
      channel: '#tweet_tsujiken',
      attachments: [{
        color: '#3939ff',
        fields: [{
          title: 'システムからの問い合わせ',
          value: content,
          short: true
        }]
      }]
    }
  end
end
