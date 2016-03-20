
class HomePage < SitePrism::Page
  set_url '/'
  element :select_make_field, '#select2-drop > div > input'
  element :make_field, "#s2id_home_select_make > a"
  element :model_field, "#s2id_home_select_model > a.select2-choice"
  element :select_model_field, '#select2-drop > div.select2-search > input.select2-input'
  element :select_model, 'li.select2-results-dept-0.select2-result'
  element :zip_field, "input[id='home_zip']"
  element :go_button, "#home_cta"
  elements :select_car, 'li.select2-results-dept-0.select2-result'


  def choose_car(zip)
    make_field.click
    make = ['Lincoln','Aston Martin','Hyundai','BMW'].sample
    select_make_field.set(make + "\n")
    model_field.click
    if make == 'Lincoln'
      model = ['MKC','MKS','MKS','MKT','MKZ','Navigator','Navigator L'].sample
      select_model_field.set(model)
      select_car[0].click

    elsif make == 'Hyundai'
      model = ['Genesis Coupe','Elantra','Santa Fe','Accent','Genesis','Sonata'].sample
      select_model_field.set(model)
      select_car[0].click

    elsif make == 'Aston Martin'
      model = ['DB9','V12 Vantage','V12 Vantage','Rapide S'].sample
      select_model_field.set(model)
      select_car[0].click

    elsif make == 'BMW'
      model = ['3 Series','2 Series','5 Series','6 Series','M3','M4','X5','i8'].sample
      select_model_field.set(model)
      select_car[0].click
    end

    zip_field.set(zip)
    go_button.click
  end

  def get_car
    make_field.click
    select_make_field.set('Lincoln' + "\n")
    model_field.click
    select_model_field.set('MKS')
    select_car[0].click
  end
end
