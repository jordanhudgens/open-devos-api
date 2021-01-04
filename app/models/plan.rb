class Plan < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  belongs_to :topic
  has_many :devos, dependent: :destroy

  has_many :plan_assignments, dependent: :destroy
  has_many :users, through: :plan_assignments

  has_one_attached :plan_image

  enum status: {
    draft: 0,
    published: 1
  }

  validates_presence_of :title,
                        :user_id,
                        :topic_id,
                        :summary

  after_commit :add_to_data_store

  def add_to_data_store
    DataStoreUpdateJob.perform_later(
      user_id: self.user.id,
      name: "user_plans"
    )
  end

  def featured_image
    if self.plan_image.attachment
      self.plan_image.attachment.service_url
    end
  end

  def featured_image_metadata
    if self.plan_image.attachment
      self.plan_image.metadata.as_json
    end
  end

  def featured_image_thumbnail
    if self.plan_image.attachment
      self
        .plan_image
        .variant(resize: '50x50x')
        .processed
        .service_url
    end
  end

  def last_published
    if self.devos.any?
      self.devos.order('updated_at desc').first.updated_at
    end
  end

  def self.order_by_most_popular
    published.order('plan_assignments_count DESC')
  end

  def self.order_by_most_recent
    order('updated_at desc')
  end

  def self.random_plans(requested_plan_count)
    order("RANDOM()").limit(requested_plan_count)
  end
end
