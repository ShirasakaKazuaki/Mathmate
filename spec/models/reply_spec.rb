require 'rails_helper'

RSpec.describe Reply, type: :model do
  # 正常系
  it '特殊文字 OK' do
    expect(FactoryBot.build(:reply, content: '🐠')).to be_valid
  end

  # 異常系
  it 'null NG' do
    expect(FactoryBot.build(:reply, content: '')).to_not be_valid
  end
end
