class SegmentController < ApplicationController
  def index
	@valCategory = params[:values]
	@valItem = params[:ids]
	@valInclude = params[:names]
	@explodedValCategory = @valCategory.split(',')
	@explodedValItem = @valItem.split(',')
	@explodedValInclude = @valInclude.split(',')
	
	$actualCount = ''
	$actualCount1 = ''
	$actualCount2 = ''
	$actualCount3 = ''	
	$actualCountQuery = ''
	$actualCountQuery1 = ''
	$actualCountQuery2 = ''
	
	@am = @explodedValCategory.each do|values|
	end
			@new_am =  @am.map(&:inspect).join('').gsub(/\"/, "")
		
	@bm = @explodedValItem.each do|ids|
	end
			@new_bm =  @bm.map(&:inspect).join('').gsub(/\"/, "'")	
	
	@cm = @explodedValInclude.each do|names|
	end
	
			@new_cm =  @cm.map(&:inspect).join('').gsub(/\"/, "")	

	@count = @explodedValItem.size	
	puts "Count is************* #{@count}"

			if @count == 0
		
						$actualCountQuery = "SELECT count(*) from r1data"
						$actualCount = R1data.count_by_sql($actualCountQuery)
				render:text => "no.of Uniqs: #{$actualCount}"		
			
			end

			if @count == 1
						
						$actualCountQuery = "SELECT count(*) from r1data"
						puts "Query is #{$actualCountQuery}"
						$actualCount = R1data.count_by_sql($actualCountQuery)

						if @new_am == "" 
							render:text => "no.of Uniqs: #{$actualCount}"
						else 
						
							if @new_am == 'Age'  
								@new_bm =  @new_bm.gsub(/\'/, "")	
								$actualCount1 = R1data.count_by_sql("SELECT count(*) from r1data where #{@new_am} #{@new_bm}")
							else
								$actualCount1 = R1data.count_by_sql("SELECT count(*) from r1data where #{@new_am} = #{@new_bm}")
							end
							if @new_cm == 'include' 
							render:text =>"no.of Uniqs: #{$actualCount1}"
							else
							@countExclude = $actualCount - $actualCount1
							render:text => "no.of Uniqs: (#{@countExclude})"
							end
										
						end	
		
	elsif @count > 1
	
		if @explodedValCategory[0] == 'Age' 
				if @explodedValInclude[0] == 'include' 
						$actualCount2Query = "SELECT count(*) FROM r1data where #{@explodedValCategory[0]} #{@explodedValItem[0]}"
						@actualCount2 =	R1data.count_by_sql($actualCount2Query) 
			#			$actualCount2Query = "SELECT count(*) FROM r1data where"
					else
						$actualCount2Query = "SELECT count(*) FROM r1data where #{@explodedValCategory[0]} NOT #{@explodedValItem[0]}"
						@actualCount2 =	R1data.count_by_sql($actualCount2Query)
			#			$actualCount2Query = "SELECT count(*) FROM r1data where"
					end	
				
				else
					if @explodedValInclude[0] == 'include'
							$actualCount2Query = "SELECT count(*) FROM r1data where #{@explodedValCategory[0]} = '#{@explodedValItem[0]}'"
							@actualCount2 =	R1data.count_by_sql($actualCount2Query)							
						else
							$actualCount2Query = "SELECT count(*) FROM r1data where #{@explodedValCategory[0]} != '#{@explodedValItem[0]}'"
							@actualCount2 =	R1data.count_by_sql($actualCount2Query) 
						end		
					
					end
					
#					@number = 
					for @number in 1..(@count-1)
					
					puts "Has query ...  #{$actualCount2Query} "
					
						if @explodedValCategory[@number] == 'Age' 
							
								if @explodedValInclude[@number] == 'include'
									
									@actualCount3Query = "#{$actualCount2Query} AND #{@explodedValCategory[@number]} #{@explodedValItem[@number]}"
									@actualCount2 = R1data.count_by_sql(@actualCount3Query)
									$actualCount2Query = @actualCount3Query	
									else
									
										@actualCount3Query = "#{$actualCount2Query} AND #{@explodedValCategory[@number]} NOT #{@explodedValItem[@number]}"
										@actualCount2 = R1data.count_by_sql(@actualCount3Query)
										$actualCount2Query = @actualCount3Query
									
									end
							
							else
							
								if @explodedValInclude[@number] == 'include'
								
									@actualCount3Query = "#{$actualCount2Query} AND #{@explodedValCategory[@number]} = '#{@explodedValItem[@number]}'"
									@actualCount2 = R1data.count_by_sql(@actualCount3Query)
									$actualCount2Query = @actualCount3Query		
								
								else
									@actualCount3Query = "#{$actualCount2Query} AND #{@explodedValCategory[@number]} != '#{@explodedValItem[@number]}'"
									@actualCount2 = R1data.count_by_sql(@actualCount3Query)
									$actualCount2Query = @actualCount3Query	
									
								end
							
							end
				end
		
	render:text=> "no.of Uniqs: #{@actualCount2}";
 end
end
  def create
  end
end
