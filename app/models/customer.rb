class Customer < ApplicationRecord
  has_many :rentals
  has_many :movies, through: :rentals

  validates :name, :presence => true, :uniqueness => true

  def movies_checked_out_count
    self.rentals.where(returned: false).length
  end
end
