
class PreferencesPage < SitePrism::Page
  element :style_field, "#s2id_select_style"
  element :color_field, "#edit_color"
  element :options_field, "#edit_opts"

  def select_preference
    color_field.click
  end
end
