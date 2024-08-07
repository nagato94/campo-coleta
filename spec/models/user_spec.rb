require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = FactoryBot.build(:user, name: nil)
    expect(user).to_not be_valid
  end

  # Adicione mais testes de validação conforme necessário
end
