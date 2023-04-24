# 管理者ユーザー
User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "admin_password",
  password_confirmation:"admin_password",
  admin: true
)

#6人分のユーザーのデータを作成
6.times do |n|
  name = "user_name#{n+1}"
  email = "user#{n+1}@example.com"
  password = "password#{n+1}"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end

#ユーザーが1人5つずつステータスを作成
User.all.each do |user|
  5.times do |n|
    status = Status.create!(
      name: "ステータス#{n+1}",
      description: "ステータス#{n+1}に取り組んでいます",
      user_id: user.id
    )
  end
end

#1番目ユーザが2~6番目のユーザをフォローする
(2..6).each do |user_number|
  User.first.subordinates << User.find(user_number)
  User.third.subordinates << User.find(user_number)
  User.fourth.subordinates << User.find(user_number)
  User.fifth.subordinates << User.find(user_number)
  User.find(6).subordinates << User.find(user_number)
end


#2番目のユーザが3~7までのユーザにメッセージを送る
(3..7).each do |recipient_id|
  conversation = Conversation.create!(sender_id: 2, recipient_id: recipient_id)
  
  5.times do |n|
    Message.create!(
      body: "こんにちは、ユーザー#{recipient_id}! これはメッセージ#{n+1}です。",
      conversation_id: conversation.id,
      user_id: 2,
      read: false
    )
  end
end















