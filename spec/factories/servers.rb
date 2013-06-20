# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :server do
    name "Example Server"
    url "http://example.server.com"
    username "user"
    password "pass"
  end
end
