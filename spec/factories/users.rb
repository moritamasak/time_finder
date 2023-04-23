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
  
end