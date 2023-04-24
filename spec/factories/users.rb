FactoryBot.define do
  factory :user do
    name { 'user10' }
    email { 'user10@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { 'false' }
  end

  factory :second_user, class: User do
    name { 'admin10' }
    email { 'admin10@example.com' }
    password { 'admin_password' }
    password_confirmation { 'admin_password' }
    admin { 'true' }
  end

  factory :thrid_user, class:User do
    name { 'user12' }
    email { 'user12@example.com' }
    password { 'password12' }
    password_confirmation { 'password12' }
    admin { 'false' }
  end
  
end