class TimelinesController < ApplicationController

  def index

  end

  def new
    @timeline = Timeline.new
  end

  def create
    @timeline = Timeline.new(timeline_params)
    @timeline.user = current_user
    if @timeline.save!
      redirect_to timelines_path(@timeline)
    else
      render :new
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
    params.require(:timeline).permit(:title, :description)
  end

end
