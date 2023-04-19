require 'slack-notifier'
require 'dotenv-rails'

class Status < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  def self.update_status
    notifier = Slack::Notifier.new(
      ENV['SLACK_WEBHOOK_URL'],
      channel: "##{ENV['SLACK_CHANNEL']}",
      username: '更新bot',
      icon_emoji: ':sunglasses:'
    )
    notifier.ping("ステータスを更新してください。")
  end

end
