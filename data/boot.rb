
# Include below all of the necessary configurations and actions
# to set up the environment and load dependencies, constants,
# and helpers. Initializes the application!

# load environmental variables
require "dotenv"
Dotenv.load

# load files in /helpers
Dir.glob(File.join("helpers", "**", "*.rb")).each do |helper|
  require_relative helper
end
