class Spina::Post < ApplicationRecord
  belongs_to :author, class_name: 'Spina::User', foreign_key: 'author_id'
  has_and_belongs_to_many :tags

  scope :published, -> { where(is_draft: false).order(published_at: :desc) }
  scope :drafts, -> { where(is_draft: true) }
  
  before_save :set_published_at, :set_materialized_path, :set_tags
  after_find :set_publish_date_and_time, :load_tags

  attr_accessor :publish_date, :publish_time, :tag_list

  # def to_param
  #   self.materialized_path
  # end

  private

  # Convert the list of tags into associated entries.
  def set_tags
    self.tags = []
    (@tag_list || "").split(',').each do |tag|
      self.tags << Spina::Tag.find_or_create_by(name: tag.strip)
    end
  end

  def load_tags
    @tag_list = self.tags.map { |t| t.name }.join(', ')
  end

  # Sets the publish date for the post.
  # * Don't set publish_at if the post is a draft.
  # * If the publish_date accessor is blank, use the current date and time.
  # * If the publish_date is set, use this plus the publish_time, defaulting to midnight.
  def set_published_at
    return if self.is_draft?
    if @publish_date.nil?
      self.published_at = DateTime.now
    else
      years, months, days = @publish_date.split('-').map { |x| x.to_i }
      hours, minutes = (@publish_time || "00:00").split(':').map { |x| x.to_i }
      self.published_at = DateTime.new(years, months, days, hours, minutes)
    end
  end

  # Sets the publish_date and publish_time accessors based on the publish date of the post.
  # * Don't set if published_at is not set.
  def set_publish_date_and_time
    return unless self.published_at
    @publish_date = self.published_at.strftime('%Y-%m-%d')
    @publish_time = self.published_at.strftime('%H:%M')
  end

  # Drafts have a materialized_path of [timestamp]_[slug] based on the current time.
  # This will be updated every time the draft is saved.
  # Published posts have a materialized_path of `/year/month/day/slug` based on the publish date.
  # This will not be updated once it has been set.
  def set_materialized_path
    if self.is_draft?
      self.materialized_path = [
        DateTime.now.strftime('%Y%m%d%H%M%s'),
        self.title.parameterize
      ].join('_')
    else
      return if self.materialized_path && self.materialized_path.include?('/')
      self.materialized_path = [
        self.published_at.strftime('%Y/%m/%d'),
        self.title.parameterize
      ].join('/')
    end
  end

end
