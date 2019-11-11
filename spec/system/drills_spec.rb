require 'rails_helper'

describe 'ドリル機能', type: :system do
    #ユーザーを作成
    let(:user_a) { FactoryBot.create(:user, id: 1, name:'ユーザーA', email: 'a@example.com') }
    #カリキュラムを作成
    let!(:curriculum_1) { FactoryBot.create(:curriculum, id:1, curriculums:'カリキュラム_1', ancestry: nil) }
    let!(:curriculum_1_1) { FactoryBot.create(:curriculum, id:2, curriculums:'カリキュラム_1_1', ancestry: '1') }
    let!(:curriculum_1_1_1) { FactoryBot.create(:curriculum, id:3, curriculums:'カリキュラム_1_1_1', ancestry: '1/2') }

  before do
    #ユーザーログインする
    visit new_user_session_path
    fill_in 'Email', with: login_user.email
    fill_in 'Password', with: login_user.password
    click_button 'Log in'
  end

  describe 'ドリル新規登録機能画面表示機能' do
    context 'ユーザーがログインしていてドリルを作成していない時' do
      let(:login_user) { user_a }

      before do
        click_on 'カリキュラムをつくる'
      end
      before do
        click_on 'カリキュラム_1_1_1'
      end
      
      it 'ドリルの新規作成ボタンが表示される' do
        #新規作成ボタンが表示される
        expect(page).to have_button '新しくカリキュラムを作る'
      end
    end

    context 'ユーザーがログインしていてドリルを作成している時' do
      let(:login_user) { user_a }
      before do
        FactoryBot.create(:drill, id: 1, title: 'test_title', discription: 'test_discription', ancestry: nil, curriculum_id: 3, user_id: 1) 
        FactoryBot.create(:drill, id: 2, title: 'test_title_1', discription: 'test_discription_1', ancestry: 1, curriculum_id: 3, user_id: 1) 
      end
      before do
        click_on 'カリキュラムをつくる'
      end
      before do
        click_on 'カリキュラム_1_1_1'
      end
      
      it '作成したドリルが表示される' do
        expect(page).to have_content '作品'
      end
    end
  end  
end