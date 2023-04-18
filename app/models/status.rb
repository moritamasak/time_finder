require 'slack-notifier'
require 'dotenv-rails'

class Status < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  def self.update_status
    notifier = Slack::Notifier.new(
      ENV['SLACK_WEBHOOK_URL'],
      channel: "##{ENV['SLACK_CHANNEL']}",
      username: '更新bot'
    )
    notifier.ping("45分経過しました。ステータスを更新してください。")
  end
  
end
