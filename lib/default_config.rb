# The page to capture
page_url "http://localhost:3000"

# Screen resolution to render at
resolution "800x600"

# Delay (in milliseconds) to wait for the server to load before taking a screenshot
delay 0

# Optional hooks for before/after each screenshot, and before/after the capture session as a whole
# Each hook can either be a string to be executed on the command line or a block of Ruby code

# before_each "forever start server.js"
# after_each "forever stop server.js"
before_all do
  puts "Starting capture session"
end
after_all do
  puts "Finished capture session"
end

# I'd hope this one's obvious enough
frames_per_second 2
