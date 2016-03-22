FactoryGirl.define do
  
  factory :idea do
    title
    body
    quality
  end

  sequence :title do |n|
    "title#{n}"
  end

  sequence :body do |n|
    "Body#{n} Body#{n} Body#{n} Body#{n} Body#{n} Body#{n} Body#{n} Body#{n} "\
    "Body#{n} Body#{n} Body#{n} Body#{n} Body#{n} Body#{n} Body#{n} Body#{n}"
  end

  sequence :quality, [0, 1, 2].cycle do |n|
    n
  end
end
