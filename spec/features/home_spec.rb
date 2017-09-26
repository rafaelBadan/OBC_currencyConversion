require 'rails_helper'

RSpec.describe "swap conversion", :type => :feature do
  it "swap currencies" do
    visit '/'
    within("#convert_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      click_button("swap")
    end

    expect('currency').to have_content("USD")
    expect('currency_destination').to have_content("EUR")
  end
end

RSpec.describe "convert Currency Process", :type => :feature do
  it "convert value", js: true do
    visit '/'
    within("#convert_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'amount', with: '10'
    end
    # test not working
    script = "$('#{amount}').trigger('change');"
    page.execute_script(script)

    save_and_open_page
    expect(page).to have_content("value")
  end
end
