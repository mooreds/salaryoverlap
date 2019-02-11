FactoryBot.define do
  factory :salary_overlap do
    linkguid { "MyString" }
  end

  factory :salary_datum do
    email { "MyString" }
    low { 1 }
    high { 2 }
    is_employer { false }
  end
end
