require 'rails_helper'

describe '投稿機能', type: :system do
	describe '一覧表示機能' do
		before do
			user_a = FactoryBot.create(:user, name: 'test', email: 'test@example.com', password: 'test')
			FactoryBot.create(:post, content: 'first post', user: user_a)
		end

		context 'ユーザーAがログインしている時' do
			before do
				visit login_path
				fill_in 'メールアドレス', with: 'test@example.com'
				fill_in 'パスワード', with: 'test'
				click_button 'ログイン'
			end

			it 'ユーザーAが作成した投稿が表示される' do
				expect(page).to have_content 'first post'
			end
		end
	end
end