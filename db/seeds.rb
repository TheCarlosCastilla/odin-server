# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Interaction.delete_all
Schedule.delete_all
Question.delete_all
Choice.delete_all
Answer.delete_all

User.create!(user_id: 'nsf1',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'nsf2',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'nsf3',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'nsf4',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'nsf5',
  imei: nil,
  is_claimed: false)

Interaction.create!(user_id: 'nsf1',
  friend_id: 'nsf2',
  time: '2014-02-02 16:42:15 -0500',
  duration: '120')

Interaction.create!(user_id: 'nsf2',
  friend_id: 'nsf1',
  time: '2014-02-02 16:42:15 -0500',
  duration: '120')

Interaction.create!(user_id: 'nsf4',
  friend_id: 'nsf5',
  time: '2014-02-02 12:30:26 -0500',
  duration: '265')

Interaction.create!(user_id: 'nsf5',
  friend_id: 'nsf4',
  time: '2014-02-02 12:30:26 -0500',
  duration: '265')

Schedule.create!(time: '2014-02-03 12:00:00 -0500',
  question_id: 'q1',
  user_id: 'nsf1')

Schedule.create!(time: '2014-02-03 12:00:00 -0500',
  question_id: 'q2',
  user_id: 'nsf2')

Schedule.create!(time: '2014-02-03 12:00:00 -0500',
  question_id: 'q1',
  user_id: 'nsf3')

Schedule.create!(time: '2014-02-03 12:00:00 -0500',
  question_id: 'q2',
  user_id: 'nsf4')

Schedule.create!(time: '2014-02-03 12:00:00 -0500',
  question_id: 'q1',
  user_id: 'nsf5')

Question.create!(question_id: "q1",
  question_text: "Question #1 Content Goes Here")

Question.create!(question_id: "q2",
  question_text: "Question #2 Content Goes Here")

Question.create!(question_id: "q3",
  question_text: "Question #3 Content Goes Here")

Choice.create!(question_id: 'q1',
  choice_id: 'a',
  choice_text: 'Text for Question 1, Choice A')

Choice.create!(question_id: 'q1',
  choice_id: 'b',
  choice_text: 'Text for Question 1, Choice B')

Choice.create!(question_id: 'q1',
  choice_id: 'c',
  choice_text: 'Text for Question 1, Choice C')

Choice.create!(question_id: 'q2',
  choice_id: 'a',
  choice_text: 'Text for Question 2, Choice A')

Choice.create!(question_id: 'q2',
  choice_id: 'b',
  choice_text: 'Text for Question 2, Choice B')

Choice.create!(question_id: 'q2',
  choice_id: 'c',
  choice_text: 'Text for Question 2, Choice C')

Choice.create!(question_id: 'q3',
  choice_id: 'a',
  choice_text: 'Text for Question 3, Choice A')

Choice.create!(question_id: 'q3',
  choice_id: 'b',
  choice_text: 'Text for Question 3, Choice B')

Choice.create!(question_id: 'q3',
  choice_id: 'c',
  choice_text: 'Text for Question 3, Choice C')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf1',
  question_id: 'q1',
  choice_id: 'a')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf1',
  question_id: 'q2',
  choice_id: 'c')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf2',
  question_id: 'q1',
  choice_id: 'b')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf2',
  question_id: 'q2',
  choice_id: 'a')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf3',
  question_id: 'q1',
  choice_id: 'a')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf3',
  question_id: 'q2',
  choice_id: 'c')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf4',
  question_id: 'q1',
  choice_id: 'b')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf4',
  question_id: 'q2',
  choice_id: 'b')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf5',
  question_id: 'q1',
  choice_id: 'c')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf5',
  question_id: 'q2',
  choice_id: 'a')
