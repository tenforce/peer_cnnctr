# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :peer do
    contact_point "MyString"
    peer_group nil
  end
end
