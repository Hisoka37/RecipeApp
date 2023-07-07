require 'rails_helper'

RSpec.describe 'Public Recipes Index Page', type: :feature do
  let!(:user) { User.create(name: 'Ridwan', email: 'example@example.com', password: 'password', confirmed_at: Time.current) }
  let!(:recipes) do
    [
      Recipe.create(name: 'Recipe 1', description: 'This is recipe 1', user:, public: true),
      Recipe.create(name: 'Recipe 2', description: 'This is recipe 2', user:, public: true),
      Recipe.create(name: 'Recipe 3', description: 'This is recipe 3', user:, public: true)
    ]
  end

  before do
    ActionMailer::Base.deliveries.clear
    user.confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
    user.confirmed_at = Time.current
    user.save
    sign_in user
    visit public_recipes_index_path
  end

  it 'displays a list of public recipes' do
    expect(recipes.first.name).to have_content('Recipe 1')
    expect(recipes.first.description).to have_content('This is recipe 1')
    expect(recipes.second.name).to have_content('Recipe 2')
    expect(recipes.second.description).to have_content('This is recipe 2')
  end
end
