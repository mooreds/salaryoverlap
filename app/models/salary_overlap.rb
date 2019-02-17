# == Schema Information
#
# Table name: salary_overlaps
#
#  id         :bigint(8)        not null, primary key
#  linkguid   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_salary_overlaps_on_linkguid  (linkguid) UNIQUE
#

class SalaryOverlap < ApplicationRecord
  before_save :set_linkguid
  has_many :salary_data

  validate :has_at_most_two_ranges

  def has_at_most_two_ranges
    if salary_data.size > 2
      errors.add(:base, "No more than two ranges allowed.")
    end
  end

  private
  def set_linkguid
    self.linkguid = SecureRandom.uuid
  end
end
