FactoryBot.define do
  factory :drill do
    title {'test_drill'}
    discription { 'ドリル作成のテストです' }
    ancestry { '' }
    curriculum
    user

  end
end