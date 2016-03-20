class App

  def home_page
    @home_page ||= HomePage.new
  end

  def preferences_page
    @preferences_page ||= PreferencesPage.new
  end
end
