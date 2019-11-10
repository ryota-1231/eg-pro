# require 'rails_helper'

# describe 'ドリル機能', type: :system do
#   describe 'ドリル新規登録機能画面表示機能' do
#     before do
#       #ユーザーを作成
#       user_a = FactoryBot.create(:user, name:'ユーザーA', email: 'a@example.com')
#       #カリキュラムを作成
#       FactoryBot.create(:curriculum, id:1, curriculums:'カリキュラム_1', ancestry: nil)
#       FactoryBot.create(:curriculum, id:2, curriculums:'カリキュラム_1_1', ancestry: '1')
#       curriculum_a = FactoryBot.create(:curriculum, id:3, curriculums:'カリキュラム_1_1_1', ancestry: '1/2')
#     end

#     context 'ユーザーがログインしている時' do
#       before do
#         #ユーザーログインする
#         visit new_user_session_path
#         fill_in 'Email', with: 'a@example.com'
#         fill_in 'Password', with: 'password'
#         click_button 'Log in'
#       end

#       before do
#         visit new_curriculum_path
#       end
#       before do
#         visit curriculum_drills_path(3)
#       end
      
#       it 'ドリルの新規作成ボタンが表示される' do
#         #新規作成ボタンが表示される
#         expect(page).to have_content '新しくカリキュラムを作る'
#       end
#     end
#   end  
# end