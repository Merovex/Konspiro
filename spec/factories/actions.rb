# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :action, :class => 'Actions' do
    attacker nil
    defender nil
    type ""
    resolved_at "2014-08-14 20:55:42"
  end
end
