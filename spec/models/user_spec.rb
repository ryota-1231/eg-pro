require 'rails_helper'

describe 'ユーザー管理機能' do
  describe 'ユーザー新規登録機能' do
    it 'nameがなければ保存できない' do
      user = User.new(name:'', email: 'a@example.com', password: 'password')
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it 'すでに登録されたnameは再度登録できない' do
      user_a = User.create(name:'test_user', email: 'a@example.com', password: 'password')
      user_b = User.create(name:'test_user', email: 'b@example.com', password: 'password')
      user_b.valid?
      expect(user_b.errors[:name]).to include("はすでに存在します")
    end

    it 'emailがなければ保存できない' do
      user = User.new(name:'test_user', email: '', password: 'password')
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'すでに登録されたemailは再度登録できない' do
      user_a = User.create(name:'test_user_a', email: 'a@example.com', password: 'password')
      user_b = User.create(name:'test_user_b', email: 'a@example.com', password: 'password')
      user_b.valid?
      expect(user_b.errors[:email]).to include("はすでに存在します")
    end
  end  
end