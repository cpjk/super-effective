# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'pokemon', 'pokemon'
  inflect.irregular 'type_efficacy', 'type_efficacies'
end
