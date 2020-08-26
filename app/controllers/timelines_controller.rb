class TimelinesController < ApplicationController
  def index
    @timelines = Timeline.all
  end
  def show
    
  end
end
