require_relative './concerns/slack'

class TopController < ApplicationController
  def inquiry
  end

  def post_inquiry
    content = params['content']
    attachments = generate_attachment_of_slack(content)
    SlackWorker.perform_async(attachments)
    redirect_to root_path
  end

  private

  def generate_attachment_of_slack(content)
    [{
      color: '#3939ff',
      fields: [{
        title: 'システムからの問い合わせ',
        value: content,
        short: true
      }]
    }]
  end
end
