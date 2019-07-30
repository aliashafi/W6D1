# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do


  User.destroy_all  

  u1 = User.create!(username: "aliashafi95")
  u2 = User.create!(username: "coolgirl22")
  u3 = User.create!(username: "mynameisjim")
  u4 = User.create!(username: "toucandancer")
  u5 = User.create!(username: "abc123supdood")


  Poll.destroy_all  

  p1 = Poll.create!(author_id: u1.id, text: 'Favorite Activities')
  p2 = Poll.create!(author_id: u2.id, text: 'Favorite Foods')
  p3 = Poll.create!(author_id: u2.id, text: 'Favorite Vacation Spot')

  Question.destroy_all

  q1 = Question.create!(poll_id: p1.id, text: 'What is your favorite sport?')
  q2 = Question.create!(poll_id: p1.id, text: 'Would you rather go for a walk or eat ice cream?')

  q3 = Question.create!(poll_id: p2.id, text: 'Do you like Pizza or Ice cream?')
  q4 = Question.create!(poll_id: p2.id, text: 'Do you like Chipotle or BajaFresh?')

  q5 = Question.create!(poll_id: p3.id, text: 'Which continent would you like to vacation?')
  q6 = Question.create!(poll_id: p3.id, text: 'Would you rather be by the ocean, or in the mountains?')

  AnswerChoice.destroy_all

  a1 = AnswerChoice.create!(question_id: q1.id, text: 'soccer')
  a2 = AnswerChoice.create!(question_id: q1.id, text: 'football')
  a3 = AnswerChoice.create!(question_id: q1.id, text: 'basketball')

  a4 = AnswerChoice.create!(question_id: q2.id, text: 'walk')
  a5 = AnswerChoice.create!(question_id: q2.id, text: 'eat ice cream')

  a6 = AnswerChoice.create!(question_id: q3.id, text: 'pizza')
  a7 = AnswerChoice.create!(question_id: q3.id, text: 'ice cream')

  a8 = AnswerChoice.create!(question_id: q4.id, text: 'chipotle')
  a9 = AnswerChoice.create!(question_id: q4.id, text: 'bajafresh')

  a10 = AnswerChoice.create!(question_id: q5.id, text: 'South America')
  a11 = AnswerChoice.create!(question_id: q5.id, text: 'Africa')
  a12 = AnswerChoice.create!(question_id: q5.id, text: 'Europe')

  a13 = AnswerChoice.create!(question_id: q6.id, text: 'Ocean')
  a14 = AnswerChoice.create!(question_id: q6.id, text: 'Mountains')

  Response.destroy_all

  Response.create(user_id: u2.id, answer_choice_id: a1.id)
  Response.create(user_id: u2.id, answer_choice_id: a4.id)

  Response.create(user_id: u1.id, answer_choice_id: a6.id)
  Response.create(user_id: u1.id, answer_choice_id: a8.id)

  Response.create(user_id: u4.id, answer_choice_id: a10.id)
  Response.create(user_id: u4.id, answer_choice_id: a13.id)


end


