RSpec.describe 'home_system', type: :system do
  it 'visit contact page from home' do
    visit root_path
    # あとで変える
    expect(page).to have_content 'Home#home'

    # あとで変える
    click_on 'Contact-test'
    expect(page).to have_content 'コンタクトページ'

    # あとで変える
    click_on 'ホーム'
    expect(page).to have_content 'Home#home'
  end

  it 'visit site_policy page from home' do
    visit root_path
    # あとで変える
    expect(page).to have_content 'Home#home'

    # あとで変える
    click_on 'Policy-test'
    expect(page).to have_content '利用規約'
  end
end
