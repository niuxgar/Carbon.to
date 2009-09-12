class WelcomeController < ApplicationController

  def index
    @all = Conversion.find(:all, :order => "category_id")
    
    @all.map {|c| c.amount = co2}
    
    @co2 = Conversion.find(:first, :conditions => {:slug => "co2"})
    @random = @all.rand
  end

  def about
  end

  def api
  end
  
  private
  def co2
    if !params[:co2].nil?
      co2 = params[:co2].to_i
      if co2 < 1 then co2 = 1 end
    else
      co2 = 1
    end
    return co2
  end

end
