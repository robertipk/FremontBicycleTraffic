require 'soda/client'
class StaticpageController < ApplicationController
  def index
  end

  def chart
  end

  def rawjson
	client = SODA::Client.new({:domain => "data.seattle.gov/",
                           :app_token => "AU94c3BhpwNnRY8ExL34d2W4x"})
	#response = client.get("4xy5-26gy", {"$where" => "date > '2014-01-01T12:00:00' AND date < '2015-01-02T18:00:00'"})
	response = client.get("4xy5-26gy", {"$order" => "'ASC'"})

	response.each do |r|
		record = Tally.find_or_create_by(date: r.date, fremont_bridge_nb: r.fremont_bridge_nb, fremont_bridge_sb: r.fremont_bridge_sb)
		record.save
	end
	@data = Tally.all
  end
end
