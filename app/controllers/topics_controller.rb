class TopicsController < ApplicationController
  
  include SlackNotification
  require 'slack-notifier'
  
  before_action :set_topic, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  
  def index
    # @topics = Topic.all
    if params[:search_key]
      @topics = Topic.where("name LIKE ? ", 
      "%#{params[:search_key]}%")
    else
      @topics = Topic.all
    end
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = @current_user.topics.create(topic_params)
    if @topic.present?
      slack_notify_to_support_topics(@topic.date, @topic.name, @topic.description, @topic.issues, @topic.source)
      redirect_to topic_url(@topic), notice: "Topic was successfully created."
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_url(@topic), notice: "Topic was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url, notice: "Topic was successfully destroyed." 
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :description, :issues, :date, :source)
    end
end
