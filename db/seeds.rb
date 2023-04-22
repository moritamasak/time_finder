# 管理者ユーザー
User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "admin_password",
  password_confirmation:"admin_password",
  admin: true
)

#5人分のユーザーのデータを作成
5.times do |n|
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

# ユーザー1が他のユーザーをフォロー
user1 = User.first
User.where.not(id: user1.id).each do |other_user|
  Follower.create!(boss_id: user1.id, subordinate_id: other_user.id)
end

# Status.all.each do |status|
#   Message.create!(
#     body: "ユーザー1のコメントです",
#     user_id: user1.id,
#     conversation_id: conversation.id
#   )
# end















