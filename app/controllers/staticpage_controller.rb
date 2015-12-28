require 'soda/client'
require 'pp'
class StaticpageController < ApplicationController
  def index
    Count.delete_all
    client = SODA::Client.new({:domain => "data.seattle.gov/",
                             :app_token => "AU94c3BhpwNnRY8ExL34d2W4x"})
    
    response = client.get("4xy5-26gy", {"$where" => "date > '2014-04-01T12:00:00' AND date < '2014-06-02T18:00:00'"})


    number = 1
    response.each do |r|
      record = Count.create(date: r.date, fremont_bridge_nb: r.fremont_bridge_nb, fremont_bridge_sb: r.fremont_bridge_sb)
      record.id = number
      number = number + 1
      record.save
    end


    @data = Count.limit(1000).order(date: :asc)
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
    Count.delete_all
    @timepoint1 = Query.new
    @timepoint2 = Query.new
    #@timepoint2 = Query.new
    #@timepoint2.timepoint = params[:t2].to_s
    @timepoint1.timepoint = params[:t1]
    @timepoint2.timepoint = params[:t2]


    client = SODA::Client.new({:domain => "data.seattle.gov/",
                             :app_token => "AU94c3BhpwNnRY8ExL34d2W4x"})
    firstdate = @timepoint1.timepoint
    seconddate = @timepoint2.timepoint

    dates = "date > '#{firstdate}' AND date < '#{seconddate}'"

    #dates = "date < '#{firstdate}'"
    responsee = client.get("4xy5-26gy", "$where" => dates)

    number = 1
    responsee.each do |r|
      record = Count.create(date: r.date, fremont_bridge_nb: r.fremont_bridge_nb, fremont_bridge_sb: r.fremont_bridge_sb)
      record.id = number
      number = number + 1
      record.save
    end


    @new = Count.limit(950).order(date: :asc)
    render :newgraph

  end

  def rawjson
    Count.delete_all

  	client = SODA::Client.new({:domain => "data.seattle.gov/",
                             :app_token => "AU94c3BhpwNnRY8ExL34d2W4x"})
  	response = client.get("4xy5-26gy", {"$where" => "date > '2014-04-01T12:00:00' AND date < '2014-06-02T18:00:00'"})
  	#response = client.get("4xy5-26gy", {"$order" => "'ASC'"})
    number = 1
    response.each do |r|
      record = Count.create(date: r.date, fremont_bridge_nb: r.fremont_bridge_nb, fremont_bridge_sb: r.fremont_bridge_sb)
      record.id = number
      number = number + 1
      record.save
    end

    @data = Count.limit(500).order(date: :asc)
  end



end
