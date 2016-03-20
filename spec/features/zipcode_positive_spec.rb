  require 'spec_helper'

  feature 'autoblog happy path zipcode test flow' do
    let(:app) { App.new }
    let(:list) { YAML.load_file(File.expand_path('../data/zipcodes.yml', File.dirname(__FILE__))) }

    before do
      app.home_page.load
      page.driver.browser.manage.window.maximize
    end

    scenario 'verifies zipcode autofill', retry: 1, retry_wait: 5,
             smoke: true, regression: true do

      app.home_page.get_car
      find('#home_cta').click
      expect(page).to have_content 'Select Your Preferences'
    end

    scenario 'verifies copying and pasting a zipcode', retry: 1, retry_wait: 5,
             regression: true do

      app.home_page.get_car
      fill_in('home_zip', with: '')
      Clipboard.copy(list.fetch('valid_zipcode'))                   #clipboard gem used to mimic copy paste behavior
      find('#home_zip').native.send_keys :command, 'v'
      find('#home_cta').click
      expect(page).to have_content 'Select Your Preferences'
    end
  end