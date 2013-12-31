class R1Controller < ApplicationController
  def form1
  #puts R1data.all(:select => 'Gender').collect {|p| p.Gender}
  end

  def noofUniqs
@names = params["names"]
@values = params["values"]
@ids = params["ids"]
  end
end
