require 'rails_helper'

describe 'User sign in' do

  it 'successfully' do
    User.create!(name: 'Erika', email: 'erika@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'

    find(:css, '#login_user').click

    within('form') do
      fill_in 'E-mail', with: 'erika@email.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    within('nav#top-nav') do
      expect(page).to have_content 'erika@email.com'
      expect(page).to have_button 'Sair'
    end
  end

end