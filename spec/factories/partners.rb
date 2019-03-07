FactoryBot.define do
  sequence :partner_name do |n|
    Faker::Name.name + n.to_s
  end
  factory :partner do
    name {:partner_name}
    description {Faker::Lorem.sentence}
    url {Faker::Internet.url}
    is_live {true}
    logo_image_url {Faker::Internet.url}
    slug { 'a fake slug'}
    trait :description_too_long do
      description {Faker::Lorem.sentence(word_count=250)}
    end
    trait :wip do
      is_live {false}
    end
    trait :no_slug do
      slug {  }
    end
  end
end