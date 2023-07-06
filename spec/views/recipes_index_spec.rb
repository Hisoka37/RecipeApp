RSpec.describe 'Recipe index', type: :feature do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: 'walid1@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit recipes_path
    end
  
    it 'displays the Recipe page title' do
      expect(page).to have_content('Recipes')
    end
  
    it 'displays recipe cards for each recipe' do
      expect(page).to have_selector('.recipe_card', count: Recipe.count)
    end
  
    it 'displays the recipe name and description' do
      Recipe.all.each do |recipe|
        expect(page).to have_content(recipe.name)
        expect(page).to have_content(recipe.description)
      end
    end
  
    it 'displays a delete button for each recipe' do
      Recipe.all.each do |recipe|
        expect(page).to have_button('Delete', count: Recipe.count)
      end
    end
  end
  