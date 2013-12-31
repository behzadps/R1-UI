class SliceController < ApplicationController
include ActionView::Helpers::NumberHelper
  def index
	@dateRange=params[:dateRange]
  	@dataQuality=params[:dataQuality]
  	@advCat=params[:advCat]
  	@campaignId=params[:campaignId]
  	@lineId=params[:lineId]
  	@strategyId=params[:strategyId]
  	@creativeId=params[:creativeId]
  	@adType=params[:adType]
  	
  	#puts "*****dateRange="+@dateRange+", dataQuality="+@dataQuality+", advCat="+@advCat+", dataQuality="+@dataQuality+", campaignId="+@campaignId+", lineId="+@lineId+", strategyId="+@strategyId+", creativeId="+@creativeId+", adType="+@adType
  	#@views = app_campaign_lineitem_banner_performance.all(:select => 'Views').collect {|p| number_with_precision(p.Views, precision: 4, significant: true)}
 	#@uniques = app_campaign_lineitem_banner_performance.all(:select => 'Uniques').collect {|q| number_with_precision(q.Uniques, precision: 4, significant: true)}
	#puts "SIZE: #{@views.size}"
	#@views = app_campaign_lineitem_banner_performance.find_by_sql("SELECT app_campaign_lineitem_banner_performance_1day_id, impressions, clicks, revenue, bids from app_campaign_lineitem_banner_performance")
 	#@uniques = app_campaign_lineitem_banner_performance.find_by_sql("SELECT Uniques from app_campaign_lineitem_banner_performance")

	@select1 = "impressions"
	@select2 = "Uniques"
	@select3 = "app_campaign_lineitem_banner_performance_1day_id"
	@select4 = "clicks"
	@select5 = "revenue"
	@select6 = "bids"
		
	@whereAdvCat = "advertiser_id = #{@advCat}"
	@whereCampaignId = "campaign_id = #{@campaignId}"
	@whereLineId = "line_id = #{@lineId}"
	@whereStrategyId = "strategy_id = #{@strategyId}"
	@whereCreativeId = "creative_id = #{@creativeId}"
	@whereAdType = "ad_type = '#{@adType}'"
	#puts "dateRange: #{@dateRange}, dataQuality: #{@dataQuality}, advCat: #{@advCat}, CampaignId: #{@campaignId}, lineId: #{@lineId}, strategyId: #{@strategyId}, creativeId: #{@creativeId}, adType: #{@adType}"
				
	if @dateRange != 'All'
		@dateToday = Date.today
		if @dateRange == '7'
			@dateNext = (@dateToday - 7)
		elsif @dateRange == '30'
			@dateNext = (@dateToday - 30)
		end
		@views= AppCampaignLineitemBannerPerformance.select(:"#{@select1}").where(:dt => @dateNext..@dateToday)
		@uniques = AppCampaignLineitemBannerPerformance.select(:"#{@select2}").where(:dt => @dateNext..@dateToday)
		
		@bids = AppCampaignLineitemBannerPerformance.select(:"#{@select6}").where(:dt => @dateNext..@dateToday)
		@clicks = AppCampaignLineitemBannerPerformance.select(:"#{@select4}").where(:dt => @dateNext..@dateToday)
		
		@ids = AppCampaignLineitemBannerPerformance.select(:"#{@select3}").where(:dt => @dateNext..@dateToday)
		@revenues = AppCampaignLineitemBannerPerformance.select(:"#{@select5}").where(:dt => @dateNext..@dateToday)
	elsif @dateRange == 'All'
		@views = AppCampaignLineitemBannerPerformance.select(:"#{@select1}")
 		@uniques = AppCampaignLineitemBannerPerformance.select(:"#{@select2}")
 		
 		@bids = AppCampaignLineitemBannerPerformance.select(:"#{@select6}")
 		@clicks = AppCampaignLineitemBannerPerformance.select(:"#{@select4}")
 		
 		@ids = AppCampaignLineitemBannerPerformance.select(:"#{@select3}")
		@revenues = AppCampaignLineitemBannerPerformance.select(:"#{@select5}")
	end
	
	if @advCat != 'All'
		@views = @views.where("#{@whereAdvCat}")
 		@uniques = @uniques.where("#{@whereAdvCat}")
 		
 		@bids = @bids.where("#{@whereAdvCat}")
 		@clicks = @clicks.where("#{@whereAdvCat}")
 		
 		@ids = @ids.where("#{@whereAdvCat}")
		@revenues = @revenues.where("#{@whereAdvCat}")
	end
	if @campaignId != 'All'
		@views = @views.where("#{@whereCampaignId}")
 		@uniques = @uniques.where("#{@whereCampaignId}")
 		
 		@bids = @bids.where("#{@whereCampaignId}")
 		@clicks = @clicks.where("#{@whereCampaignId}")
 		
 		@ids = @ids.where("#{@whereCampaignId}")
		@revenues = @revenues.where("#{@whereCampaignId}")
	end
	if @lineId != 'All'
		@views = @views.where("#{@whereLineId}")
 		@uniques = @uniques.where("#{@whereLineId}")
 		
 		@bids = @bids.where("#{@whereLineId}")
 		@clicks = @clicks.where("#{@whereLineId}")
 		
 		@ids = @ids.where("#{@whereLineId}")
		@revenues = @revenues.where("#{@whereLineId}")
	end
	if @strategyId != 'All'
		@views = @views.where("#{@whereStrategyId}")
 		@uniques = @uniques.where("#{@whereStrategyId}")
 		
 		@bids = @bids.where("#{@whereStrategyId}")
 		@clicks = @clicks.where("#{@whereStrategyId}")
 		
 		@ids = @ids.where("#{@whereStrategyId}")
		@revenues = @revenues.where("#{@whereStrategyId}")
	end
	if @creativeId != 'All'
		@views = @views.where("#{@whereCreativeId}")
 		@uniques = @uniques.where("#{@whereCreativeId}")
 		
 		@bids = @bids.where("#{@whereCreativeId}")
 		@clicks = @clicks.where("#{@whereCreativeId}")
 		
 		@ids = @ids.where("#{@whereCreativeId}")
		@revenues = @revenues.where("#{@whereCreativeId}")
	end
	if @adType != 'All'
		@views = @views.where("#{@whereAdType}")
 		@uniques = @uniques.where("#{@whereAdType}")
 		
 		@bids = @bids.where("#{@whereAdType}")
 		@clicks = @clicks.where("#{@whereAdType}")
 		
 		@ids = @ids.where("#{@whereAdType}")
		@revenues = @revenues.where("#{@whereAdType}")
	end
	if @dataQuality != 'All'
		puts "dataQuality is not All"
		if @dataQuality == '1'
			@views = @views.order('impressions ASC').first(30)
 			@uniques = @uniques.order('Uniques ASC').first(30)
 			@bids = @bids.order('bids ASC').first(30)
 			@clicks = @clicks.order('impressions ASC').first(30)
 		
 			@ids = @ids.order('impressions ASC').first(30)
			@revenues = @revenues.order('impressions ASC').first(30)
		elsif @dataQuality == '2'
			@views = @views.order('impressions DESC').last(30)
 			@uniques = @uniques.order('Uniques DESC').last(30)
 			@bids = @bids.order('bids DESC').last(30)
 			@clicks = @clicks.order('impressions DESC').first(30)
 		
 			@ids = @ids.order('impressions DESC').last(30)
			@revenues = @revenues.order('impressions DESC').last(30)
		end
	elsif @dataQuality == 'All'
		puts "dataQuality is All"
		@views = @views
 		@uniques = @uniques
 		@bids = @bids
 		@clicks = @clicks
 		
 		@ids = @ids
		@revenues = @revenues
	end
	@views = @views.collect {|p| number_with_precision(p.impressions, precision: 5, significant: true)}
	@uniques = @uniques.collect {|q| number_with_precision(q.Uniques, precision: 4, significant: true)}
	@bids = @bids.collect {|q| number_with_precision(q.bids, precision: 5, significant: true)}
	@clicks = @clicks.collect {|q| number_with_precision(q.clicks, precision: 5, significant: true)}
	
	@views1 = @views;
	@uniques1 = @uniques;
	@ids = @ids.collect {|p| number_with_precision(p.app_campaign_lineitem_banner_performance_1day_id, precision: 9, significant: true)}
	@revenues = @revenues.collect {|p| number_with_precision(p.revenue, precision: 4, significant: true)}
	
	#puts "clicks:: #{@clicks}"
	@CTRs = "["
	for i in 0..@views.size-1
		if @clicks[i] == '0.0000'
			@CTR = @clicks[i].to_i
			 
			if i == 0
				@CTRs = @CTRs + "#{@CTR}"
			else
   				@CTRs = @CTRs + ", #{@CTR}"
   			end
		else
			@CTR = @views[i].to_i/@clicks[i].to_i
			
			if i == 0
				@CTRs = @CTRs + "#{@CTR}"
			else
   				@CTRs = @CTRs + ", #{@CTR}"
   			end
   		end
	end
	@CTRs = @CTRs + "]"
	#puts "CTRs: #{@CTRs}"
	
	#puts "views1:: #{@views1}"
	#puts "uniques1:: #{@uniques1}"
	#puts "ids:: #{@ids}"
	#puts "revenues:: #{@revenues}"
	@rowVal = ""
	for i in 0..@views1.size-1
   		@rowVal = @rowVal + "<tr><td>#{@ids[i]}</td><td>#{@views1[i]}</td><td>#{@uniques1[i]}</td><td>#{@revenues[i]}</td></tr>"
	end
	
	#puts "rowVal:: #{@rowVal}"
	#@rowVal = "<tr><td>@idsList[$i]</td><td>@dataFromDb[$i]</td><td>$dataFromDb1[@i]</td><td>@revenueList[@i]</td></tr>"
  		
  end
end
