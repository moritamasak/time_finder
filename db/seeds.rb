#10人分のユーザーのデータを作成
10.times do |n|
  name = "User#{n+1}"
  email = "user#{n+1}@example.com"
  password = "password#{n+1}"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end

