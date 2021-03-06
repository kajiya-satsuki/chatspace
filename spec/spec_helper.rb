require 'database_cleaner'

RSpec.configure do |config|

  config.before(:suite) do
   DatabaseCleaner.strategy = :truncation
 end

 config.before(:each) do
   DatabaseCleaner.start
 end

 config.after(:each) do
   DatabaseCleaner.clean
 end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end