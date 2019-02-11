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

require 'test_helper'

class SalaryOverlapTest < ActiveSupport::TestCase
  test "linkguid set on save" do
    so = build(:salary_overlap, linkguid: nil)
    assert so.valid?
    assert so.linkguid.nil?
    so.save
    assert !so.linkguid.nil?
  end
  test "can have zero salary data" do
    so = build(:salary_overlap)
    assert so.valid?
  end
  test "can have one salary data" do
    so = build(:salary_overlap)
    so.salary_data << build(:salary_datum)
    assert so.valid?
  end
  test "can have two salary data" do
    so = build(:salary_overlap)
    so.salary_data << build(:salary_datum)
    so.salary_data << build(:salary_datum)
    assert so.valid?
  end
  test "cannot have three salary data" do
    so = build(:salary_overlap)
    so.salary_data << build(:salary_datum)
    so.salary_data << build(:salary_datum)
    so.salary_data << build(:salary_datum)
    assert !so.valid?
  end
end
