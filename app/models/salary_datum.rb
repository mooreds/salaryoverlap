# == Schema Information
#
# Table name: salary_data
#
#  id          :bigint(8)        not null, primary key
#  email       :string
#  linkguid    :string
#  low         :integer
#  high        :integer
#  is_employer :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SalaryDatum < ApplicationRecord
  validates :email, presence: true
  validates :linkguid, presence: true
  validates :is_employer, inclusion: { in: [true, false] }
  validates :low, numericality: { less_than: ->(salary_datum) { salary_datum.high } }, unless: Proc.new {|sd| sd.low.nil? || sd.high.nil? }
  validates :high, numericality: { greater_than: ->(salary_datum) { salary_datum.low } }, unless: Proc.new {|sd| sd.low.nil? || sd.high.nil? }

end
