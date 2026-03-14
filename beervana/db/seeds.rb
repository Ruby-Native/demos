Rake::Task["breweries:import"].invoke

# Augmented data for select breweries (manually researched).
# This will be replaced by automated website scraping + LLM extraction in Phase 4.
BREWERY_DETAILS = {
  "241b680f-f114-440d-a662-67869a68e262" => { # Great Notion Brewing
    hours: "Mon-Thu 11:30am-9pm, Fri-Sat 11:30am-10pm, Sun 11:30am-9pm",
    food: "Full kitchen",
    outdoor_seating: true,
    dog_friendly: true,
    kid_friendly: true,
    wifi: true
  },
  "45249b6e-b1d0-4c2f-a60e-ab483169287f" => { # Breakside Brewery
    hours: "Daily 11:30am-9pm",
    food: "Full kitchen",
    outdoor_seating: true,
    dog_friendly: true,
    kid_friendly: true,
    wifi: true
  },
  "3486d742-3bd5-449a-b66e-d3a881c3c103" => { # Wayfinder Beer
    hours: "Sun-Thu 12pm-9pm, Fri-Sat 12pm-10pm",
    happy_hour: "Wed-Thu 3-5pm",
    food: "Full kitchen",
    outdoor_seating: true,
    dog_friendly: false,
    kid_friendly: true,
    wifi: false
  },
  "5e07c2a9-63b7-4c82-8167-13f350b811a6" => { # Ecliptic Brewing
    hours: "Sun-Thu 11am-9pm, Fri-Sat 11am-10pm",
    food: "Full kitchen",
    outdoor_seating: true,
    dog_friendly: true,
    kid_friendly: true,
    wifi: true
  },
  "bc8fdd30-e644-4b4a-a05b-41857bc8e0ad" => { # Hopworks Urban Brewery
    hours: "Sun-Thu 11am-9pm, Fri-Sat 11am-10pm",
    food: "Full kitchen",
    outdoor_seating: true,
    dog_friendly: true,
    kid_friendly: true,
    wifi: true,
    events: "Trivia night"
  }
}.freeze

BREWERY_DETAILS.each do |open_brewery_db_id, attrs|
  brewery = Brewery.find_by(open_brewery_db_id: open_brewery_db_id)
  brewery&.update!(attrs)
end

puts "Augmented #{BREWERY_DETAILS.size} breweries with detail data."
