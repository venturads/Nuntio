class Tower < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include Commentable

  monetize :price_per_month_cents

  # Associations

  belongs_to :category

  has_one :tower_guard
  has_one :guard, through: :tower_guard
  accepts_nested_attributes_for :tower_guard

  # has_many :tower_guards
  # has_many :guards, through: :tower_guards

  has_many :subscriptions, -> { where(state: :confirmed) }
  has_many :users, through: :subscriptions

  has_many :reports

  # Delegators

  delegate :theme, to: :category

  # Constants

  FREQUENCIES = %w(daily weekly bimonthly monthly).freeze

  GRADES = %w(all beginner intermediate advanced).freeze

  SORTS = %w(popularity_desc publish_date_desc price_asc).freeze

  # Validators

  validates :category, :title, :description, presence: true

  # Methods

  def average_time_to_read
    reports.any? ? (reports.map { |r| r.average_time_to_read }.sum / reports.count.to_d).to_i : 0
  end
end
