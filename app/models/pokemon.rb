# frozen_string_literal: true

# Pokemon
class Pokemon < ApplicationRecord
  belongs_to :type1, class_name: 'Type'
  belongs_to :type2, class_name: 'Type', optional: true
  belongs_to :generation

  before_save :calculate_total

  validates :number,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true, uniqueness: true
  validates :hp, :attack, :defense, :sp_atk, :sp_def, :speed,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :legendary, inclusion: { in: [true, false] }

  validates :type1, presence: true
  validates :generation, presence: true

  private

  def calculate_total
    self.total = hp + attack + defense + sp_atk + sp_def + speed
  end
end
