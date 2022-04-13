FactoryBot.define do
  factory :user do
    name { 'test_name' }
    email { "test#{rand(1...1000)}@mail.com" }
    phone_number { '9090909090' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test_img.png'), 'image/png') }
    password { 'testpassword' }
  end
end