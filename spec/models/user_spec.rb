require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user is valid' do
    @user = User.new(
      name: 'test_name', 
      email: 'test@mail.com', 
      phone: '9090909090',
      avatar: fixture_file_upload(Rails.join('spec', 'support', 'test-img.png'), 'image/png'),
      password: 'testpassword'
    )

    expect(user).to be_valid
  end

  it 'user is not valid' do
    @user = User.new(
      name: 'test_name', 
      email: 'test@mail.com', 
      phone: '9090909090',
      password: 'testpassword'
    )

    expect(user).to_not be_valid
  end
end
