# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the file that contains ENV variables (namely my_variables.rb) before environments/*.rb
my_variables = File.join(Rails.root, 'config', 'initializers', 'my_variables.rb')
load(my_variables) if File.exists?(my_variables)

# Initialize the Rails application.
Rails.application.initialize!
