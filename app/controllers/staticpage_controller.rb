require 'soda/client'
class StaticpageController < ApplicationController
  def index
  end

  def visual
  end

  def query
  end

  def challenges
  end

  def newgraph
  end

  def parse_form
    
    @timepoint1 = Query.new
    @timepoint2 = Query.new
    @timepoint2.timepoint = params[:t2].to_s
    @timepoint1.timepoint = params[:t1].to_s
    @timepoint1.save
    @timepoint2.save
    @time = Time.new
    render :newgraph

  end

  def rawjson
  	client = SODA::Client.new({:domain => "data.seattle.gov/",
                             :app_token => "AU94c3BhpwNnRY8ExL34d2W4x"})
  	response = client.get("4xy5-26gy", {"$where" => "date > '2014-01-01T12:00:00' AND date < '2014-03-02T18:00:00'"})
  	#response = client.get("4xy5-26gy", {"$order" => "'ASC'"})

  	response.each do |r|
  		record = Count.find_or_create_by(date: r.date, fremont_bridge_nb: r.fremont_bridge_nb, fremont_bridge_sb: r.fremont_bridge_sb)
  		record.save
  	end
  	@data = Count.limit(40).order(date: :asc)
  end


end
