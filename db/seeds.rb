

User.create(user_name: "DavidBowie", password_hash: BCrypt::Password.create("password"))

first_deck = Deck.create(title: "What?")

first_deck.cards << Card.create(question: "What does the cow say?", answer: "moo")
first_deck.cards << Card.create(question: "What does the cat say?", answer: "meow")
