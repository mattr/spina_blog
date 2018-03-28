require 'test_helper'

class Spina::PostTest < ActiveSupport::TestCase

  setup do
    @post = create(:post)
  end

  test "should require title" do
    post = Spina::Post.new
    refute post.valid?
    assert_not_nil post.errors.include?(:title)
  end

  test "should have an author" do
    assert_not_nil @post.author.name
  end

  test "should set publish_date and publish_time after find" do
    post = Spina::Post.find(@post.id)
    assert_not_nil @post.published_at
    assert_not_nil post.publish_date
    assert_not_nil post.publish_time
    assert_equal @post.published_at.strftime('%Y-%m-%d'), post.publish_date.strftime('%Y-%m-%d')
    assert_equal @post.published_at.strftime('%H:%M'), post.publish_time
  end

  test "should set published_at from publish_date and publish_time" do
    date = DateTime.now
    post = build(:post, { author: @post.author, published_at: nil, publish_date: date, publish_time: "20:30" })
    assert post.valid?
    post.save
    assert_equal post.published_at, DateTime.new(date.year, date.month, date.day, 20, 30)
  end

end
