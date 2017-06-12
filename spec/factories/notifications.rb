FactoryGirl.define do
  factory :notification do
    user nil
    notified_by nil
    match nil
    read false
  end
end
