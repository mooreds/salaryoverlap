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
end
