require 'bcrypt'

User.create(user_name: "DavidBowie", password_hash: BCrypt::Password.create("password"))
