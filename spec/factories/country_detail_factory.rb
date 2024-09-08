FactoryBot.define do
  factory :country_detail do
    association :country
    observation { "Brasil tem uma das praias mais lindas, Maragogi" }
    picture { "http://maragogi.com.br" }
  end
end