class Plan < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  belongs_to :topic
  has_many :devos, dependent: :destroy

  enum status: {
    draft: 0,
    published: 1
  }

  validates_presence_of :title,
                        :user_id,
                        :topic_id,
                        :summary

  def last_published
    if self.devos.any?
      self.devos.order('updated_at desc').first.updated_at
    end
  end
end
