require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'user comments on a post' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: user1)

    comment = FactoryBot.create(:comment, user: user2, post: post)

    expect(post.comments.count).to eql 1
    expect(post.comments.first.user).to eql user2
    expect(user2.comments.first).to eql comment
  end
end
