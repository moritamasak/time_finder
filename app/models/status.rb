require 'slack-notifier'
require 'dotenv-rails'

class Status < ApplicationRecord
  belongs_to :user
  validates :name, presence: true,length: { maximum: 20 }
  validates :description, length: { maximum: 40 } 
  
  def self.update_status
    notifier = Slack::Notifier.new(
      ENV['SLACK_WEBHOOK_URL_2'],
      channel: "##{ENV['SLACK_CHANNEL_2']}",
      username: 'ステータス更新ガイド',
      icon_emoji: ':sunglasses:'
    )
    notifier.ping("ステータスを更新してください。よろしくお願いします。")
  end

end
