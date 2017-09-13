require 'rails_helper'

RSpec.feature 'User visits the home page' do
  scenario 'and sees the website name' do
    visit '/'

    expect(page).to have_content 'Storedom'
  end
end
