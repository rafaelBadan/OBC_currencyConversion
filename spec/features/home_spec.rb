require 'rails_helper'

RSpec.describe "convert Currency Process", :type => :feature do
  it "convert value" do
    visit '/'
    within("#convert_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'amount', with: '10'
    end
    click_button 'CONVERTER'

    save_and_open_page
    expect(page).to have_content("value")
  end
end
