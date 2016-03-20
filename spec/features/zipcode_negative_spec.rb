    require 'spec_helper'

    feature 'autoblog zipcode validation test flow' do
      let(:app) { App.new }
      let(:list) { YAML.load_file(File.expand_path('../data/zipcodes.yml', File.dirname(__FILE__))) }

      before do
        app.home_page.load
        page.driver.browser.manage.window.maximize
      end


      scenario 'verifies zipcode with special characters', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('special_characters'))
        expect(page).to have_content "It looks like you've entered an invalid ZIP code. Please try again."
      end


      scenario 'verifies zipcode with space', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('space'))
        expect(page).to have_content "It looks like you've entered an invalid ZIP code. Please try again."
      end


      scenario 'verifies zipcode with no digits', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('nondigits'))
        expect(page).to have_content "It looks like you've entered an invalid ZIP code. Please try again."
      end


      scenario 'verifies blank zipcode', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('blank'))
        expect(page).to have_content "It looks like you've entered an invalid ZIP code. Please try again."
      end


      scenario 'verifies negative zipcode', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('negative'))
        expect(page).to have_content "It looks like you've entered an invalid ZIP code. Please try again."
      end


      scenario 'verifies a zipcode with less than 5 digits', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('short'))
        expect(page).to have_content "It looks like you've entered an invalid ZIP code. Please try again."
      end


      scenario 'verifies a zipcode greater than 5 digits', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('long'))
        expect(page).to have_content "It looks like you've entered an invalid ZIP code. Please try again."
      end


      scenario 'verifies a non-existing zipcode', retry: 1, retry_wait: 5,
               regression: true do
        app.home_page.choose_car(list.fetch('non-existing'))
        find('.body', :text => "It looks like you've entered an invalid ZIP code. Please try again.")
      end


      scenario 'verifies a valid zipcode', retry: 1, retry_wait: 5,
               smoke: true, regression: true do
        app.home_page.choose_car(list.fetch('valid_zipcode'))
        expect(page).to have_content "Select Your Preferences"
      end
    end