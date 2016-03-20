  require 'capybara/rspec'
  require 'capybara'
  require 'selenium-webdriver'
  require 'site_prism'
  require 'yaml'
  require 'rspec/retry'
  require 'rspec_junit_formatter'
  require 'clipboard'
  require 'capybara-screenshot/rspec'
  require_relative './pages/preferences_page'
  require_relative './pages/home_page'
  require './helpers/app'

  RSpec.configure do |config|
    config.verbose_retry = true
    config.expect_with :rspec do |expectations|
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    end

    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end
  end

  Capybara.configure do |config|
    config.run_server = false
    config.ignore_hidden_elements = false
    config.default_driver = :selenium
    config.default_max_wait_time = 50                                       #default wait time
    config::Screenshot.autosave_on_failure = true
    config.save_and_open_page_path = 'test-reports/'
    config.app_host = ENV['APP_HOST']
  end

  if ENV['GRID_URL']                                                         #selenium grid configuration
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app,
                                     browser: :remote,
                                     url: ENV['GRID_URL'],
                                     desired_capabilities: :firefox)
    end
  end
