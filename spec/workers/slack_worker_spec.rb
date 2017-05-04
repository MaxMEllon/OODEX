# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlackWorker, type: :worker do
  let(:commit_log) { `git log --oneline`.split("\n").first }

  let(:attachments) do
    [{
      color: '#3939ff',
      fields: [{
        title: 'Rspec SlackWorker perform test',
        value: "#{DateTime.now.iso8601}##{commit_log}"
      }]
    }]
  end
  let(:slack) { SlackWorker.new }

  it 'enqueues slack job' do
    result = slack.perform(attachments)
    expect(result.code).to match('200')
  end
end
