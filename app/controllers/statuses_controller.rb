class StatusesController < ApplicationController
  before_action :set_status, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create,:update, :destroy]

  def index
    if current_user.present?
      @statuses = current_user.statuses
    else
      redirect_to new_user_session_path
    end

  end

  def show
  end

  def new
    @status = Status.new
  end

  def edit
  end

  def create
    @status = current_user.statuses.build(status_params)
    respond_to do |format|
      if @status.save
        format.html { redirect_to statuses_url}
        format.json { render :show, status: :created, location: @status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to statuses_url }
        format.json { render :show, status: :ok, location: @status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url }
      format.json { head :no_content }
    end
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:name, :description)
    end

    def notifier
      Slack::Notifier.new(
        ENV['SLACK_WEBHOOK_URL2'],
        channel: "##{ENV['SLACK_CHANNEL2']}",
        username: '更新Bot', 
        icon_emoji: ':sunglasses:'
      )
    end
end
