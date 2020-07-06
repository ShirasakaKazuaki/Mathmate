require 'rails_helper'

RSpec.describe Post, type: :model do
  word50 = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx'
  word51 = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxa'
  img10 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test10MB.jpg'))
  img1less = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test1MBless.jpg'))
  img3 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test3MB.png'))

  describe 'titleのバリデーション' do
    # 正常系
    it '1文字以上 OK' do
      expect(FactoryBot.build(:post, title: 'a')).to be_valid
    end

    it '50文字以下 OK' do
      expect(FactoryBot.build(:post, title: word50)).to be_valid
    end

    it '特殊文字 OK' do
      expect(FactoryBot.build(:post, title: '🥳')).to be_valid
    end

    # 異常系
    it 'null NG' do
      expect(FactoryBot.build(:post, title: '')).to_not be_valid
    end

    it '51文字以上 NG' do
      expect(FactoryBot.build(:post, title: word51)).to_not be_valid
    end
  end

  describe 'questionのバリデーション' do
    # 正常系
    it 'null OK' do
      expect(FactoryBot.build(:post, question: '')).to be_valid
    end

    it '特殊文字 OK' do
      expect(FactoryBot.build(:post, question: '😭')).to be_valid
    end
  end

  describe 'qimgのバリデーション' do
    # 正常系
    it 'null OK' do
      expect(FactoryBot.build(:post)).to be_valid
    end

    it '1MB以下 OK' do
      expect(FactoryBot.build(:post, qimg: img1less)).to be_valid
    end

    it '1MB以上 OK' do
      expect(FactoryBot.build(:post, qimg: img3)).to be_valid
    end

    # 異常系
    it '10MB以上 NG' do
      expect(FactoryBot.build(:post, qimg: img10)).to_not be_valid
    end
  end

  describe 'answerのバリデーション' do
    # 正常系
    it 'null OK' do
      expect(FactoryBot.build(:post, answer: '')).to be_valid
    end

    it '特殊文字 OK' do
      expect(FactoryBot.build(:post, answer: '😭')).to be_valid
    end
  end

  describe 'aimgのバリデーション' do
    # 正常系
    it 'null OK' do
      expect(FactoryBot.build(:post)).to be_valid
    end

    it '1MB以下 OK' do
      expect(FactoryBot.build(:post, aimg: img1less)).to be_valid
    end

    it '1MB以上 OK' do
      expect(FactoryBot.build(:post, aimg: img3)).to be_valid
    end

    # 異常系
    it '10MB以上 NG' do
      expect(FactoryBot.build(:post, aimg: img10)).to_not be_valid
    end
  end

  describe 'contentのバリデーション' do
    # 正常系
    it '特殊文字 OK' do
      expect(FactoryBot.build(:post, content: '😭')).to be_valid
    end

    # 異常系
    it 'null NG' do
      expect(FactoryBot.build(:post, content: '')).to_not be_valid
    end
  end

  describe 'supplementのバリデーション' do
    # 正常系
    it 'null OK' do
      expect(FactoryBot.build(:post, supplement: '')).to be_valid
    end

    it '特殊文字 OK' do
      expect(FactoryBot.build(:post, supplement: '😭')).to be_valid
    end
  end
end
