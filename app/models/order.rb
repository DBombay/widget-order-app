class Order < ApplicationRecord
  validate :valid_need_by
  validates :widget_type,
    inclusion: {
      in: ["Widget", "Widget Pro", "Widget Xtreme"],
      message: "%{value} is not a valid type."
    }
  validates :color,
    inclusion: {
      in: ["red", "blue", "yellow"],
      message: "%{value} is not a valid color."
    }
  validates :quantity, presence: true, numericality: {greater_than: 0, only_integer: true}

  def valid_need_by
    if need_by.nil? || need_by < (1.week.from_now.beginning_of_day + 8.hours)
      errors.add(:need_by, message: "must be at least a week from now")
    end
  end
end
