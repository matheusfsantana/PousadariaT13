require 'rails_helper'


describe 'User register list' do
  it 'successfully' do
    user = User.create!(name: 'João', email: 'joão@email.com', password: '123456')
    login_as user, scope: :user

    visit root_path
    click_on 'Minhas Listas'
    click_on 'Criar Lista'
    fill_in 'Nome', with: 'Carnaval'
    click_on 'Criar'


    list = List.last
    expect(list.name).to eq 'Carnaval'
    expect(page).to have_css 'div.alert', text: 'Lista cadastrada com sucesso'
    expect(page).to have_content 'Carnaval'
  end
end