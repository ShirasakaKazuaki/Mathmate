require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'contentのバリデーション ' do
    # 正常系
    it '特殊文字 OK' do
      expect(FactoryBot.build(:response, content: '🐠')).to be_valid
    end

    # 異常系
    it 'null NG' do
      expect(FactoryBot.build(:response, content: '')).to_not be_valid
    end
  end
end
