require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'user can follow another user' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)

    Subscription.create(followed: user2, followed_by: user1)

    expect(user2.followers.count).to eql 1
    expect(user2.followers).to include user1

    expect(user1.following.count).to eql 1
    expect(user1.following).to include user2

    expect(user2.following.count).to eql 0
    expect(user2.following).to_not include user1

    expect(user1.followers.count).to eql 0
    expect(user1.followers).to_not include user2

    user3 = FactoryBot.create(:user)

    Subscription.create(followed: user2, followed_by: user3)

    expect(user2.followers.count).to eql 2
    expect(user2.followers).to include user3

    expect(user3.following.count).to eql 1
    expect(user3.following).to include user2
  end
end
