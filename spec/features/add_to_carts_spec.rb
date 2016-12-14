require 'rails_helper'

RSpec.feature "Visitor adds a product into their cart", type: :feature, js: true do

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

  scenario "They click on the Add button and the quantity in cart should update" do
    # ACT
    visit root_path
    page.first('.product').first('a', text: 'Add').click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_link('My Cart (1)')
  end
end