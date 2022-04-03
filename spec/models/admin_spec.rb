require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'admin is valid' do
    admin = Admin.new(email: 'test@mail.com', password: 'testpassword')

    expect(admin.email).to eql 'test@mail.com'
    expect(admin).to be_valid
  end
end
