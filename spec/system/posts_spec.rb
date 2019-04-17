require 'rails_helper'

describe '投稿管理機能', type: :system do
	let(:user_a) {  FactoryBot.create(:user, name: 'ユーザーA', email: 'test@example.com', password: 'test')}
	let(:user_b) {  FactoryBot.create(:user, name: 'ユーザーB', email: 'testb@example.com', password: 'test')}
	describe '投稿一覧表示機能' do
		before do
			FactoryBot.create(:post, content: 'first post', user_id: user_a.id)
			visit login_path
			fill_in 'メールアドレス', with: login_user.email
			fill_in 'パスワード', with: login_user.password
			click_button 'ログイン'
		end

		context 'ユーザーAがログインしている時' do
			let(:login_user) { user_a }
			it 'ユーザーAが作成した投稿が表示される' do
				expect(page).to have_content 'first post'
			end
		end

		context 'ユーザーBがログインしてる時' do
			let(:login_user) { user_b }

			it 'ユーザーAが作成した投稿が表示される' do
				expect(page).to have_content 'first post'
			end
		end
	end

	describe 'ユーザー詳細表示機能' do
		before do
			FactoryBot.create(:post, content: 'first post', user_id: user_a.id)
			visit login_path
			fill_in 'メールアドレス', with: login_user.email
			fill_in 'パスワード', with: login_user.password
			click_button 'ログイン'
			visit user_path(login_user)
		end

		context 'ユーザーAがログインしている時' do
			let(:login_user) { user_a }
			
			it 'ユーザーAが作成した投稿が表示される' do
				expect(page).to have_content 'first post'
			end
		end
	end
end