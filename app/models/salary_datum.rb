# == Schema Information
#
# Table name: salary_data
#
#  id                :bigint(8)        not null, primary key
#  email             :string           not null
#  high              :integer          not null
#  is_employer       :boolean          not null
#  low               :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  salary_overlap_id :bigint(8)
#
# Indexes
#
#  index_salary_data_on_salary_overlap_id  (salary_overlap_id)
#

class SalaryDatum < ApplicationRecord
  validates :email, presence: true
  validates :is_employer, inclusion: { in: [true, false] }
  validates :low, numericality: { less_than: ->(salary_datum) { salary_datum.high } }, unless: Proc.new {|sd| sd.low.nil? || sd.high.nil? }
  validates :high, numericality: { greater_than: ->(salary_datum) { salary_datum.low } }, unless: Proc.new {|sd| sd.low.nil? || sd.high.nil? }
  belongs_to :salary_overlap, required: false

  after_create :init_salary_overlap

  private
  def init_salary_overlap
    unless salary_overlap_id 
      so = SalaryOverlap.new 
      so.salary_data << self
      so.save
    end
  end


end
