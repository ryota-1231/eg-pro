require 'rails_helper'

describe 'カリキュラム機能', type: :system do
  describe 'カリキュラム一覧機能' do
    before do
      #ユーザーを作成
      user_a = FactoryBot.create(:user, name:'ユーザーA', email: 'a@example.com')
      #カリキュラムを作成
      FactoryBot.create(:curriculum, curriculums:'カリキュラム_1', ancestry: nil)
      # FactoryBot.create(:curriculum, curriculums:'カリキュラム_1_1', ancestry: '1')
      # FactoryBot.create(:curriculum, curriculums:'カリキュラム_1_1_1', ancestry: '1/2')
    end

    context 'ユーザーがログインしている時' do
      before do
        #ユーザーログインする
        visit new_user_session_path
        fill_in 'Email', with: 'a@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end

      it 'カリキュラムの一覧が表示される' do
        #作成されているカリキュラムの一覧が表示されている
        expect(page).to have_content 'カリキュラム_1'
      end
    end
  end
end