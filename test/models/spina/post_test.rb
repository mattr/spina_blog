require 'test_helper'

class Spina::PostTest < ActiveSupport::TestCase

  # setup do
  #   @post = create(:post)
  # end

  test "should require title" do
    post = Spina::Post.new
    refute post.valid?
    assert_not_nil post.errors.include?(:title)
  end

  test "should have an author" do
    # assert_not_nil @post.author.name
    post = create(:post)
    assert_not_nil post.author.name
  end

  test "should set publish_date and publish_time after find" do
    created = create(:post)
    found   = Spina::Post.find(created.id)
    assert_not_nil created.published_at
    assert_not_nil found.publish_date
    assert_not_nil found.publish_time
    assert_equal created.published_at.strftime('%Y-%m-%d'), found.publish_date.strftime('%Y-%m-%d')
    assert_equal created.published_at.strftime('%H:%M'), found.publish_time
  end

  test "should set published_at from publish_date and publish_time" do
    # create(:post)
    date = DateTime.now
    post = build(:post, { published_at: nil, publish_date: date, publish_time: "20:30" })
    assert post.valid?
    post.save
    assert_equal post.published_at, DateTime.new(date.year, date.month, date.day, 20, 30)
  end

  test "should set published_at to current date and time if publish_date is not set and is_draft is false" do
    post = create(:post, { published_at: nil, publish_date: nil, is_draft: false })
    assert_not_nil post.published_at
    assert_equal DateTime.now.strftime('%Y%m%d'), post.published_at.strftime('%Y%m%d')
  end

  test "should set materialized_path with timestamp and parameterized path when draft" do
    post = create(:post, { is_draft: true })
    assert_not_nil post.materialized_path
    assert_equal 2, post.materialized_path.split('_').length
    assert_equal post.title.parameterize, post.materialized_path.split('_').last
  end

  test "should update materialized path when published" do
    post = create(:post, { is_draft: true })
    draft_path = post.materialized_path
    post.update({ is_draft: false })
    assert_not_equal draft_path, post.materialized_path
    assert_equal 4, post.materialized_path.split('/').length
    assert_equal post.title.parameterize, post.materialized_path.split('/').last
  end


end
