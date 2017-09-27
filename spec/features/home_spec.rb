require 'rails_helper'

RSpec.describe "swap conversion", :type => :feature do
  xit "swap currencies" do
    visit '/'
    within("#convert_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      click_button 'swap_currencies'
    end
    expect(find_field('currency').value).to eq 'USD'
    expect(find_field('currency_destination').value).to eq 'EUR'
  end
end

RSpec.describe "convert Currency Process", :type => :feature do
  xit "convert value", :js => true do
    visit '/'
    within("#convert_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'amount', with: '10'
    end

    script = "$('#{amount}').trigger('keyup');"
    page.execute_script(script)

    save_and_open_page
    expect(page).to have_content("value")
  end
end
