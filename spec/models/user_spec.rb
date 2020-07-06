require 'rails_helper'

RSpec.describe User, type: :model do
  letter200 = 'thisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisi'
  letter201 = 'athisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisis200testthisi'
  img10 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test10MB.jpg'))
  img1less = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test1MBless.jpg'))
  img3 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test3MB.png'))

  # 必須チェック
  describe 'nameのバリデーション ' do
    # 正常系
    it "name,passwordさえあれば OK" do
      expect(FactoryBot.build(:user)).to be_valid 
    end
    
    # 異常系
    it "nameなし NG" do
      expect(FactoryBot.build(:user, name: '')).to_not be_valid 
    end

    it "passwordなし NG" do
      expect(FactoryBot.build(:user, password: '')).to_not be_valid 
    end
  end

  describe 'nameのバリデーション ' do
    # 正常系
    it "1文字以上 OK" do
      expect(FactoryBot.build(:user, name: 'a')).to be_valid 
    end

    it "20文字以下 OK" do
      expect(FactoryBot.build(:user, name: 'abcdefghijabcdefghij')).to be_valid
    end

    it "emojiOK" do
      expect(FactoryBot.build(:user, name: 'test😎')).to be_valid 
    end

    # 異常系
    it "null NG" do
      expect(FactoryBot.build(:user, name: '')).to_not be_valid
    end

    it "21文字以上 NG" do
      expect(FactoryBot.build(:user, name: 'abcdefghijabcdefghija')).to_not be_valid
    end
  end
  
  describe 'emailのバリデーション' do
    # 正常系
    it "メアド形式 OK" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    # 異常系
    it "null NG" do
      expect(FactoryBot.build(:user, email: '')).to_not be_valid
    end

    it "メアド形式でないもの NG" do
      expect(FactoryBot.build(:user, email: 'aaaaa')).to_not be_valid
    end

    it "既存のメアド NG" do
      user1 = FactoryBot.create(:user, name: "taro", password: "P@ssw0rd", email: "taro@example.com")
      expect(FactoryBot.build(:user, email: 'taro@example.com')).to_not be_valid
    end

    it "大文字 NG" do
      expect(FactoryBot.build(:user, email: 'THISISTEST＠example.com')).to_not be_valid
    end

    it "絵文字 NG" do
      expect(FactoryBot.build(:user, email: '💩🤔😇@gmail.com')).to_not be_valid
    end
  end

  describe 'profileのバリデーション' do
    # 正常系
    it "null OK" do
      expect(FactoryBot.build(:user, profile: '')).to be_valid
    end

    it "200文字以下 OK" do
      expect(FactoryBot.build(:user, profile: letter200)).to be_valid
    end

    it "特殊文字 OK" do
      expect(FactoryBot.build(:user, profile: '😇')).to be_valid
    end

    # 異常系
    it "201文字以上NG" do
      expect(FactoryBot.build(:user, profile: letter201)).to_not be_valid
    end
  end

  describe "passwordのバリデーション" do
    # 正常系
    it "6文字以上 OK" do
      expect(FactoryBot.build(:user, password: 'a@1a3P')).to be_valid
    end

    it "12文字以下 OK" do
      expect(FactoryBot.build(:user, password: 'abcdaefab@1P')).to be_valid
    end

    # 異常系
    it "6文字以下 NG" do
      expect(FactoryBot.build(:user, password: 'a@1P3')).to_not be_valid
    end

    it "12文字以上 NG" do
      expect(FactoryBot.build(:user, password: 'abcdefabcP@1a')).to_not be_valid
    end

    it "null NG" do
      expect(FactoryBot.build(:user, password: '')).to_not be_valid
    end

    it "英字のみ NG" do
      expect(FactoryBot.build(:user, password: 'aaaaaaaa')).to_not be_valid
    end

    it "数字のみ NG" do
      expect(FactoryBot.build(:user, password: '11111111')).to_not be_valid
    end

    it "記号のみ NG" do
      expect(FactoryBot.build(:user, password: '@@@@@@@@')).to_not be_valid
    end

    it "英数字のみ NG" do
      expect(FactoryBot.build(:user, password: 'aaaa1111')).to_not be_valid
    end

    it "数字記号のみ NG" do
      expect(FactoryBot.build(:user, password: '1111@@@@')).to_not be_valid
    end

    it "英字記号のみ NG" do
      expect(FactoryBot.build(:user, password: 'aaaa@@@@')).to_not be_valid
    end
  end  

  describe "uimgのバリデーション" do
    # 正常系
    it "null OK" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "1MB以下 OK" do
      expect(FactoryBot.build(:user, uimg: img1less)).to be_valid
    end

    it "1MB以上 OK" do
      expect(FactoryBot.build(:user, uimg: img3)).to be_valid
    end

    # 異常系
    it "10MB以上 NG" do
      expect(FactoryBot.build(:user, uimg: img10)).to_not be_valid
    end
  end
end
