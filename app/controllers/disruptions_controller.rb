class DisruptionsController < ApplicationController
  
  def new
    @disruption = Disruption.new
  end

  def create
    audit params
    @disruption = Disruption.new(params[:disruption])
    @disruption.save
    redirect_to '/thanks'

  end
 
  def thanks
    @disruption = Disruption.all.count

  end
end