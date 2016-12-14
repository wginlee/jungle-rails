require 'rails_helper'

RSpec.feature "Visitor navigates to a product details page", type: :feature, js: true do

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
  end

  scenario "They enter the product detail page upon clicking on a product" do
    # ACT
    visit root_path
    page.first('.product').first('header').first('a').click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page.current_path).to have_text('/product')
  end
end