require 'soda/client'
class StaticpageController < ApplicationController
  def index
  end

  def chart
  end

  def infodata
  end

  def infodataset
  end

  def challenges
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
	@data = Count.limit(20).order(date: :asc)
  end
end
