require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @user = User.create!(name: "Dan", email: "d@d.com", password: "123", password_confirmation: "123")

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    visit root_path
  end

  scenario "They log in" do
    # ACT
    page.click_link('Login')
    # DEBUG
    sleep 1
    
    fill_in 'email', with: @user.email
    sleep 1

    fill_in 'password', with: @user.password
    sleep 1
    save_screenshot('login-filled-out.png')

    click_on 'Submit'
    sleep 1


    # VERIFY
    save_screenshot('logged-in.png')
    expect(page).to have_text 'Dan'
  end
end