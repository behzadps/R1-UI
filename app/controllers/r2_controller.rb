class R2Controller < ApplicationController
include ActionView::Helpers::NumberHelper
  def singlelinechart
 #@views = Chartdetails.all(:select => 'Views').collect {|p| number_with_precision(p.Views, precision: 4, significant: true)}
 #@uniques = Chartdetails.all(:select => 'Uniques').collect {|q| number_with_precision(q.Uniques, precision: 4, significant: true)}
  end
end