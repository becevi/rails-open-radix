class TimelinesController < ApplicationController

  def index
    @timelines = Timeline.all
  end
  def show
    @timeline = Timeline.find(params[:id])
  end

  def new
    @timeline = Timeline.new
    @timeline.saved_articles.build
  end

  def create
    @timeline = Timeline.new(timeline_params)
    @timeline.user = current_user
    if @timeline.save!
      redirect_to timelines_path(@timeline)
    else
      render :new
    end
  end

  def edit
  end

def update
  @timeline.update(timeline_params)
  if @timeline.save
    redirect_to timeline_path(@timeline)
  else
    render :edit
  end
end

  def destroy
    @timeline.destroy
    redirect_to timelines_path
  end

  private

  def timeline_params
    params.require(:timeline).permit(:topic, :description)
  end

end
