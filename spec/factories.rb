Factory.define :user do |user|
  user.name                  "Dastan Kojomuratov"
  user.email                 "dastan@mail.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo Bar"
  micropost.association :user
end