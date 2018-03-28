class Spina::Post < ApplicationRecord
  belongs_to :author, class_name: 'Spina::User', foreign_key: 'author_id'
  has_and_belongs_to_many :tags
  
  before_save :set_published_at
  after_find :set_publish_date_and_time

  attr_accessor :publish_date, :publish_time

  private

  def set_published_at
    return if @publish_date.nil? || self.is_draft?
    hours, minutes = @publish_time.split(':').map { |x| x.to_i }
    self.published_at = DateTime.new(@publish_date.year, @publish_date.month, @publish_date.day, hours || 0, minutes || 0)
  end

  def set_publish_date_and_time
    @publish_date = self.published_at
    @publish_time = self.published_at.strftime('%H:%M')
  end

end
