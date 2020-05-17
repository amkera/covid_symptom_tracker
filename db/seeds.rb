johndoe = User.create(name: "John Doe", email: "johndoe@fakedomain.com", password: "1234")
janedoe = User.create(name: "Jane Doe", email: "janedoe@fakedomain.com", password: "5678")
user3 = User.create(name: "User 3", email: "user3@fakedomain.com", password: "9101112")
user4 = User.create(name: "User 4", email: "user4@fakedomain.com", password: "13141516")

Case.create(
  cough: 1,
  difficulty_breathing: 1,
  fever: 1,
  chills: 1,
  muscle_pain: 1,
  sore_throat: 1,
  smell_or_taste_loss: 1,
  user_id: johndoe.id
)
#scale from 1-10
Case.create(
  cough: 10,
  difficulty_breathing: 9,
  fever: 8,
  chills: 9,
  muscle_pain: 7,
  sore_throat: 9,
  smell_or_taste_loss: 10,
  user_id: janedoe.id
)
Case.create(
  cough: 3,
  difficulty_breathing: 4,
  fever: 3,
  chills: 4,
  muscle_pain: 5,
  sore_throat: 4,
  smell_or_taste_loss: 4,
  user_id: user3.id
)
Case.create(
  cough: 6,
  difficulty_breathing: 7,
  fever: 8,
  chills: 6,
  muscle_pain: 6,
  sore_throat: 7,
  smell_or_taste_loss: 6,
  user_id: user4.id
)
