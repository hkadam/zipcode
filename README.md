## Zipcode verification Test

This package contains UI tests for truecar autoblog site, using [siteprism][1], [capybara][2], [rspec][3] and [selenium webdriver][4].


##### Installation steps to run the tests:
(Firefox browser needs to be pre-installed)

1. Clone the package
2. `bundle install`
3. `bundle exec rake spec`

By default, the `rake spec` task runs all the tests on the local machine, using Firefox browser.
You can pass command-line variables to run against other environments and/or against Selenium Grid.

For example:

To run against prod environment, run the tests using:

`APP_HOST=https://autoblog.truecar.com rake spec`

To just run with `smoke test` tag:

`SPEC_OPTS='--tag smoke' rake spec`

To just with all specs `regression test` tag:

`SPEC_OPTS='--tag regression' rake spec`

To run using Selenium Grid specifying parallel nodes:

`GRID_URL=http://localhost:4444/wd/hub NODES=2 bundle exec rake spec`



##### My approach:
I am using [siteprism][1] A Capybara Page Object Model DSL for automated acceptance testing.Added are
two specs with positive and negative scenarios in features under spec folder.The pages folder has home page
and preference pages which have the methods used in feature specs.
The home page object provides encapsulation so any modifications to the homepage will only require a change in page objects.
In data folder under spec there is a yml file with a list of zipcode test data to test zipcode field.
rspec_junit_formatter gem added to generate junit reports in test-reports folder which show the count and can be added in
as artifacts for Bamboo/Jenkins continuous integration tools.
capybara-screenshot gem added which captures a page screenshot on failure in the test-reports folder.
The .rspec file is used for setting output format.
The spec_helper.rb has all the configurations for setting the capybara driver, wait time, app_host and Grid settings.
parallel_tests gem added to run the tests in parallel on each nodes(firefox instance) to save run time.

Compromises made:
Only selective few random makes & models added and the random selection logic is added in the home_page instead of a helper.


##### Future enhancements:
1) Use a restclient/airborne gem to GET https://autoblog.truecar.com/nc/api/make-models-s2 api response and parse json
 to get car makes and models in a helper file.
2) The random make,model selection logic could have been taken out from pages and added in a helper file instead.
3) Run specs in different browsers(chrome,safari),different mobile screen resolutions to test if site is responsive.



[1]: https://github.com/natritmeyer/site_prism
[2]: https://github.com/jnicklas/capybara
[3]: https://www.relishapp.com/rspec
[4]: http://www.seleniumhq.org/
