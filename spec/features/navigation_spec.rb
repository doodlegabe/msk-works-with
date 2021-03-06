require 'rails_helper'

RSpec.describe 'Navigation is available', :type => :feature do

  it 'checks for top navigation', :js => true  do
    visit root_path
    expect(page).to have_selector(:css, 'a[href="/home"]')
    expect(page).to have_selector(:css, 'a[href="/works_withs"]')
    expect(page).to have_selector(:css, 'a[href="/partners"]')
    # expect(page).to have_selector(:css, 'a[href="/testimonials"]')
  end

end