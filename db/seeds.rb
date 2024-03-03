def create_flight(duration, start_time, arriving_airport, departing_airport)
  Flight.create(duration: duration, start_time: start_time, arriving_airport: arriving_airport, departing_airport: departing_airport)
end

def random_date
  Time.now + rand(8).days + rand(23).hours
end

airports = {}

%i[PDX MSP LAX SEA PHX].each do |code|
  airports[code] = Airport.create(code: code.to_s)
end

# PDX < - > MSP
10.times do
  create_flight 4, random_date, airports[:MSP], airports[:PDX]
  create_flight 4, random_date, airports[:PDX], airports[:MSP]
end

# PDX < - > LAX
10.times do
  create_flight 4, random_date, airports[:LAX], airports[:PDX]
  create_flight 4, random_date, airports[:PDX], airports[:LAX]
end

# PDX < - > SEA
10.times do
  create_flight 1, random_date, airports[:SEA], airports[:PDX]
  create_flight 1, random_date, airports[:PDX], airports[:SEA]
end

# PDX < - > PHX
10.times do
  create_flight 5, random_date, airports[:PHX], airports[:PDX]
  create_flight 5, random_date, airports[:PDX], airports[:PHX]
end

# MSP < - > LAX
10.times do
  create_flight 7, random_date, airports[:LAX], airports[:MSP]
  create_flight 7, random_date, airports[:MSP], airports[:LAX]
end

# MSP < - > SEA
10.times do
  create_flight 4, random_date, airports[:SEA], airports[:MSP]
  create_flight 4, random_date, airports[:MSP], airports[:SEA]
end

# MSP < - > PHX
10.times do
  create_flight 6, random_date, airports[:MSP], airports[:PHX]
  create_flight 6, random_date, airports[:PHX], airports[:MSP]
end

# SEA < - > LAX
10.times do
  create_flight 5, random_date, airports[:LAX], airports[:SEA]
  create_flight 5, random_date, airports[:SEA], airports[:LAX]
end

# LAX < - > PHX
10.times do
  create_flight 1, random_date, airports[:LAX], airports[:PHX]
  create_flight 1, random_date, airports[:PHX], airports[:LAX]
end

# PHX < - > SEA
10.times do
  create_flight 6, random_date, airports[:SEA], airports[:PHX]
  create_flight 6, random_date, airports[:PHX], airports[:SEA]
end
