# == Schema Information
#
# Table name: salary_data
#
#  id          :bigint(8)        not null, primary key
#  email       :string           not null
#  high        :integer          not null
#  is_employer :boolean          not null
#  linkguid    :string           not null
#  low         :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_salary_data_on_linkguid  (linkguid) UNIQUE
#

class SalaryDatum < ApplicationRecord
  validates :email, presence: true
  validates :is_employer, inclusion: { in: [true, false] }
  validates :low, numericality: { less_than: ->(salary_datum) { salary_datum.high } }, unless: Proc.new {|sd| sd.low.nil? || sd.high.nil? }
  validates :high, numericality: { greater_than: ->(salary_datum) { salary_datum.low } }, unless: Proc.new {|sd| sd.low.nil? || sd.high.nil? }

  before_save :set_linkguid

  private
  def set_linkguid
    self.linkguid = SecureRandom.uuid
  end
end
