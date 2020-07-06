require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  # ユーザーが新規投稿できるかのテスト 
  describe "user creates a new post" do
    # 画像ファイルの指定
    image_1mb = (Rails.root.join("spec/fixtures/test1MB.jpg")
    image_1mbless = (Rails.root.join("spec/fixtures/test1MBless.jpg")
    image_3mb = (Rails.root.join("spec/fixtures/test3MB.jpg")

    # 隠し要素にも対応
    Capybara.ignore_hidden_elements = false

    # 共通操作
    before do
      # ユーザーを作成
      @user = User.create(
        name: "John",
        email: "test@example.com",
        password: "P@ssw0rd"
      )
      # トップページへアクセス
      visit root_path
      # サインインページへ遷移
      visit "/users/sign_in"
      # メアドとパスワードを入力してログイン
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"
      # 投稿画面にアクセス
      visit "/posts/new"
    end

    it "全フォームを埋める→OK" do
      expect {
        fill_in "post[question]", with: "This is test"
        find('label[for=post_qimg]').click.set(image_1mb)
        fill_in "post[answer]", with: "This is test"
        find('label[for=post_aimg]').click.set(image_1mb)
        fill_in "post[content]", with: "This is test"
        fill_in "post[title]", with: "This is test"
        find('label[for=post_unit_ids_1]').click
        fill_in "post[supplement]", with: "This is test"
        click_button "commit"
      }.to change { Post.count }.by(1)
    end

    # 画像テスト
    it "[Q]画像サイズテスト" do
      expect {
        fill_in "post[question]", with: "This is test"
        find('label[for=post_qimg]').click.set(image_1mbless)
        fill_in "post[answer]", with: "This is test"
        find('label[for=post_aimg]').click.set(image_3mb)
        fill_in "post[content]", with: "This is test"
        fill_in "post[title]", with: "This is test"
        find('label[for=post_unit_ids_1]').click
        fill_in "post[supplement]", with: "This is test"
        click_button "commit"
      }.to change { Post.count }.by(1)
    end 
    
  end
end
