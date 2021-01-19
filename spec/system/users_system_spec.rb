RSpec.describe 'users_system', type: :system do
  let(:signup) { create(:user) }
  let(:login) do
    signup
    visit new_user_session_path
    fill_in "ユーザー名", with: "bob"
    fill_in "パスワード", with: "dottle-nouveau-pavilion-tights-furze"
    click_button "ログイン"
  end

  context 'have created user' do
    it 'redirect to user#index page when login successful' do
      login
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'ログイン後トップ'
    end

    it 'can visit users#show page' do
      login
      visit user_path(signup.id)
      expect(current_path).to eq user_path(signup.id)
    end
  end

  context 'not have created user' do
    it 'can not visit user#index page unless login' do
      visit users_path
      expect(current_path).to eq new_user_session_path
      expect(page).not_to have_content 'ログイン後トップ'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    it 'redirect to user#edit page when signup new user first time' do
      visit new_user_registration_path
      fill_in "ユーザー名", with: "tomy"
      fill_in "メールアドレス", with: "tomy@example.com"
      within(:css, '.password') do
        fill_in "パスワード", with: "dottle-nouveau-pavilion-tights-furze"
      end
      within(:css, '.pass-conf') do
        fill_in "もう一度パスワードを入力してください", with: "dottle-nouveau-pavilion-tights-furze"
      end
      click_button "アカウントを作成する"
      expect(current_path).to eq edit_user_registration_path
      expect(page).to have_content '登録完了しました！詳細情報を確認してください'
    end
  end
end
