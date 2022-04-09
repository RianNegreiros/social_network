FactoryBot.define do
  factory :user do
    name { 'test_name' }
    email { 'test@mail.com' }
    phone { '9090909090' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test-avatar.png'), 'image/png') }
    password { 'testpassword' }
  end
end