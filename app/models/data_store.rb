class DataStore < ApplicationRecord
  belongs_to :user

  after_initialize :generate_version_date

  validates_presence_of :version_date, :payload

  enum name: [
    :devos,
    :plans
  ]

  def self.current_version
    self
      .order(version_date: :desc)
      .first
      .payload
  end

  private

    def generate_version_date
      self.version_date = DateTime.now
    end
end
