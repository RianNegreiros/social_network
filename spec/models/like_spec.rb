require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'user likes a post' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    user3 = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: user1)

    Like.create(user: user2, post: post)

    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql user2

    Like.create(user: user3, post: post)

    expect(post.likes.count).to eql 2
    expect(post.likes.last.user).to eql user3

    Like.find_by(post: post, user: user2).destroy

    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql user3
  end
end
