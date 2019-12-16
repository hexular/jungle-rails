require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

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

  scenario "They click on a product" do
    # ACT
    page.first('article.product').click_link('Details')
    # DEBUG
    sleep 1
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end