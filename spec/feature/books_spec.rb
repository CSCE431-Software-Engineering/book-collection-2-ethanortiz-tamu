require 'rails_helper'

RSpec.describe 'Books', type: :feature do
  describe 'creating a book' do
    it 'creates a book and shows a flash notice' do visit new_book_path
      fill_in 'Title', with: 'Sample Book'
      fill_in 'Author', with: 'John Doe'
      fill_in 'Price', with: 19.99
      fill_in 'Published date', with: '01-01-2022'
      click_button 'Create Book'

      expect(page).to have_content('Book was successfully created.')
      expect(page).to have_content('Sample Book')
      expect(page).to have_content('John Doe')
      expect(page).to have_content('19.99')
      expect(page).to have_content('2022-01-01')
    end

    it 'shows a flash notice for a book with a blank title' do
      visit new_book_path
      fill_in 'Title', with: ''
      # Add other fields as needed
      click_button 'Create Book'

      expect(page).to have_content("Title can't be blank")
    end
  end
end