# The page to capture
page_url "http://tomorrowsharvest.dev"

# The path of the project. Will assume current directory if not set (doesn't work yet)
# repo_path "/Users/skattyadz/Dropbox/code/tomorrowsharvest"

# Screen resolution to render at
resolution "800x600"

# Optional delay (in milliseconds) to wait for the server to load before taking a screenshot
# delay 250

# Optional hooks for before/after each individual screenshot, as well as before/after the capture session as a whole
# Each hook can either be a string to be executed on the command line, or a block of Ruby code

before_each "forever start server.js"
after_each "forever stop server.js"

before_all do
  puts "This is some ruby code executed before capturing starts"
end

after_all do
  puts "This code will run after everything's finished"
end

# I'd hope this one's obvious enough
frames_per_second 1

# Uncomment if you don't want to delete the source frames when finished (doesn't work yet)
# keep_images

