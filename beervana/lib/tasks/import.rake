namespace :breweries do
  desc "Import Portland breweries from Open Brewery DB"
  task import: :environment do
    require "net/http"
    require "json"

    ALLOWED_TYPES = %w[micro brewpub regional contract proprietor large].freeze

    POSTAL_CODE_NEIGHBORHOODS = {
      "97209" => "Pearl District",
      "97210" => "Northwest",
      "97201" => "Downtown",
      "97204" => "Downtown",
      "97205" => "Downtown",
      "97214" => "Inner Southeast",
      "97202" => "Southeast",
      "97206" => "Southeast",
      "97211" => "Northeast",
      "97212" => "Northeast",
      "97213" => "Northeast",
      "97232" => "Central Eastside",
      "97227" => "Mississippi",
      "97203" => "North Portland",
      "97217" => "North Portland"
    }.freeze

    NEIGHBORHOOD_POSITIONS = {
      "Pearl District" => 1,
      "Northwest" => 2,
      "Downtown" => 3,
      "Mississippi" => 4,
      "Central Eastside" => 5,
      "Inner Southeast" => 6,
      "Southeast" => 7,
      "Northeast" => 8,
      "North Portland" => 9
    }.freeze

    base_url = "https://api.openbrewerydb.org/v1/breweries"

    meta_uri = URI("#{base_url}/meta?by_city=portland&by_state=oregon")
    meta = JSON.parse(Net::HTTP.get(meta_uri))
    total = meta["total"].to_i
    pages = (total / 50.0).ceil

    puts "Found #{total} breweries in Open Brewery DB. Fetching #{pages} page(s)..."

    imported = 0
    skipped = 0

    (1..pages).each do |page|
      uri = URI("#{base_url}?by_city=portland&by_state=oregon&per_page=50&page=#{page}")
      breweries_data = JSON.parse(Net::HTTP.get(uri))

      breweries_data.each do |data|
        unless ALLOWED_TYPES.include?(data["brewery_type"])
          skipped += 1
          next
        end

        zip5 = data["postal_code"].to_s.split("-").first
        neighborhood_name = POSTAL_CODE_NEIGHBORHOODS[zip5]

        unless neighborhood_name
          skipped += 1
          next
        end

        neighborhood = Neighborhood.find_or_create_by!(name: neighborhood_name) do |n|
          n.position = NEIGHBORHOOD_POSITIONS[neighborhood_name] || 99
        end

        brewery = Brewery.find_or_initialize_by(open_brewery_db_id: data["id"])
        brewery.update!(
          name: data["name"],
          brewery_type: data["brewery_type"],
          street: data["street"],
          city: data["city"],
          state: data["state"],
          postal_code: data["postal_code"],
          phone: data["phone"],
          website_url: data["website_url"],
          latitude: data["latitude"],
          longitude: data["longitude"],
          neighborhood: neighborhood
        )

        imported += 1
      end
    end

    puts "Imported #{imported} breweries, skipped #{skipped} (closed/planning)."
    puts "#{Neighborhood.count} neighborhoods created."
  end
end
