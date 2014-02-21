require 'bcrypt'

User.create(user_name: "Princess_Leila", password_hash: ("1234"))


User.create(user_name: "DavidBowie", password_hash: BCrypt::Password.create("password"))
