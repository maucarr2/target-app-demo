class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show edit update destroy ]

  def index
    @topics = Topic.all
    render json: @topics
  end

  def show
    render json: @topics
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.json { render :show, status: :created, location: @topic }
      else
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.json { render :show, status: :ok, location: @topic }
      else
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :body)
    end
end
