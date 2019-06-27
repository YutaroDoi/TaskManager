# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { '掃除' }
    description { '家の掃除をする' }
    expire { Time.now }
    status { '未実施' }
    label { '家事' }
    priority { 1 }
  end
end
