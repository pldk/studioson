class CalendarsController < ApplicationController
  def show
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
  	# @events_by_date = Studio.group_by(&:date) && Choeurs.group_by(&:date)
  	@events_by_date
  end
end
