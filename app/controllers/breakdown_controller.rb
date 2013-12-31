class BreakdownController < ApplicationController
include ActionView::Helpers::NumberHelper
include ActionView::Helpers::UrlHelper
  def index
 
$oneValue=0
#first chart
  @arrayofClicks = AppCampaignLineitemBannerPerformance.find_by_sql("select clicks, Uniques, impressions, conversions, bids from app_campaign_lineitem_banner_performance")
		@sum = @arrayofClicks.map(&:clicks).inject(0, :+)
		@sum2 = @arrayofClicks.map(&:Uniques).inject(0, :+)
		@impr = @arrayofClicks.map(&:impressions).inject(0, :+)
		@conversions = @arrayofClicks.map(&:conversions).inject(0, :+)
		@bids = @arrayofClicks.map(&:bids).inject(0, :+)
 		@sum3 = (@sum+@sum2)
 		@firstPieValue = "#{(@sum.to_f / @sum3) * 100}"
 		@secondPieValue = "#{(@sum2.to_f / @sum3) * 100}"
 		@firstPieValue1 = number_with_precision(@firstPieValue, :precision => 2)
 		@secondPieValue1 = number_with_precision(@secondPieValue, :precision => 2)





#second chart  
  @arrayofAppNexus = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'app_nexus'")
  @arrayofBRXRTB = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'BRX-RTB'")
  @arrayofAdXRTB = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'AdX-RTB'")
  @arrayofRubiconRTB = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'Rubicon-RTB' ")
  @arrayofOpenXRTB = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'OpenX-RTB' ")
  @arrayofrmx = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'rmx' ")
  @arrayofusermatch = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'user_match' ")
 		@sumAppNexus = @arrayofAppNexus.map(&:Uniques).inject(0, :+)
		@sumBRXRTB = @arrayofBRXRTB.map(&:Uniques).inject(0, :+)
		@sumAdXRTB = @arrayofAdXRTB.map(&:Uniques).inject(0, :+)
		@sumRubiconRTB = @arrayofRubiconRTB.map(&:Uniques).inject(0, :+)
		@sumOpenXRTB = @arrayofOpenXRTB.map(&:Uniques).inject(0, :+)
		@sumrmx = @arrayofrmx.map(&:Uniques).inject(0, :+)
		@sumusermatch = @arrayofusermatch.map(&:Uniques).inject(0, :+)
		
		@finalResult = (@sumAppNexus+@sumBRXRTB+@sumAdXRTB+@sumRubiconRTB+@sumOpenXRTB+@sumrmx+@sumusermatch)
		
		@perAppNexus = "#{(@sumAppNexus.to_f / @finalResult) * 100}"
		@perBRXRTB ="#{(@sumBRXRTB.to_f / @finalResult) * 100}"
		@perAdXRTB = "#{(@sumAdXRTB.to_f / @finalResult) * 100}"
		@perRubiconRTB = "#{(@sumRubiconRTB.to_f / @finalResult) * 100}"
		@perOpenXRTB = "#{(@sumOpenXRTB.to_f / @finalResult) * 100}"
		@perrmx = "#{(@sumrmx.to_f / @finalResult) * 100}"
		@perusermatch = "#{(@sumusermatch.to_f / @finalResult) * 100}"
		
		
		@preAppNexus =number_with_precision(@perAppNexus, :precision => 2)
		@preBRXRTB =number_with_precision(@perBRXRTB, :precision => 2)
		@preAdXRTB = number_with_precision(@perAdXRTB, :precision => 2)
		@preRubiconRTB = number_with_precision(@perRubiconRTB, :precision => 2)
		@preOpenXRTB = number_with_precision(@perOpenXRTB, :precision => 2)
		@prermx = number_with_precision(@perrmx, :precision => 2)
		@preusermatch = number_with_precision(@perusermatch, :precision => 2)





#third chart
  @arrayofDisplay = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where ad_type = 'ONLINE_DISPLAY' ")
  @arrayofMobile = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance where source_name = 'MOBILE_APP_DISPLAY' ")
		
		@sumDisplay = @arrayofDisplay.map(&:Uniques).inject(0, :+)
		@sumMobile = @arrayofMobile.map(&:Uniques).inject(0, :+)	
		
		@finalResult1 = (@sumDisplay+@sumMobile)	
		
		@perDisplay = "#{(@sumDisplay.to_f / @finalResult1) * 100}"
		@perMobile ="#{(@sumMobile.to_f / @finalResult1) * 100}"
		
		@preDisplay =number_with_precision(@perDisplay, :precision => 2)
		@preMobile =number_with_precision(@perMobile, :precision => 2)

#singlelinechart


@uniques = AppCampaignLineitemBannerPerformance.find_by_sql("select Uniques from app_campaign_lineitem_banner_performance limit 20").collect {|q| number_with_precision(q.Uniques, precision: 4, significant: true)}    
@impressions = AppCampaignLineitemBannerPerformance.find_by_sql("select impressions from app_campaign_lineitem_banner_performance limit 20").collect {|p| number_with_precision(p.impressions, precision: 4, significant: true)}

@uniques1 = @uniques.map(&:inspect).join(',').gsub(/\"/, "")
 
@impressions1 = @impressions.map(&:inspect).join(',').gsub(/\"/, "")


 puts "Impression  **** #{@uniques1} ******** #{@impressions1} "

 #geo map
@arrayValuesGeo = GeoMapState.find_by_sql("select Country_code, country_name, value_map from geo_map_state") 

@country_codes = [] 
@country_names = [] 
@map_values = [] 

	 @arrayValuesGeo.each do |st| 
	 puts st.country_name
		@country_codes << st.Country_code 
		@country_names << st.country_name 
		@map_values << st.value_map 
		
   end
  end 
end
