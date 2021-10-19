require 'rails_helper'

RSpec.describe User, type: :model do
  let(:invalid_name_user) {build(:user, name: '12', password: '1234567Qw')}
  let(:valid_name_user) {build(:user, name: '12da', password: '1234567Qw')}
  let(:invalid_password_user) {build(:user, name: '12da', password: '123456Q')}
  let(:valid_password_user) {build(:user, name: '12da', password: '1234567Qw')}

  describe 'user' do
    it 'invalid_name_user' do
      expect(invalid_name_user.valid?).to eq false
    end
    it 'valid_name_user' do
      expect(valid_name_user.valid?).to eq true
    end
    it 'invalid_password_user' do
      expect(invalid_password_user.valid?).to eq false
    end
    it 'valid_password_user' do
      expect(valid_password_user.valid?).to eq true
    end
  end
end
