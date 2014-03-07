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
Rule.delete_all

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

User.create!(user_id: 'nsf6',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'nsf7',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'nsf8',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'nsf9',
  imei: nil,
  is_claimed: false)

User.create!(user_id: 'ns10',
  imei: nil,
  is_claimed: false)

Interaction.create!(user_id: 'nsf1',
  peer_id: 'nsf2',
  time: '2014-02-02 16:42:15 -0500',
  duration: '120')

Interaction.create!(user_id: 'nsf2',
  peer_id: 'nsf1',
  time: '2014-02-02 16:42:15 -0500',
  duration: '120')

Interaction.create!(user_id: 'nsf4',
  peer_id: 'nsf5',
  time: '2014-02-02 12:30:26 -0500',
  duration: '265')

Interaction.create!(user_id: 'nsf5',
  peer_id: 'nsf4',
  time: '2014-02-02 12:30:26 -0500',
  duration: '265')

Schedule.create!(time:  '2014-02-03 12:00:00 -0500',
  question_id: '1',
  user_id: 'nsf1',
  sent: false)

Schedule.create!(time:  '2014-02-03 12:00:00 -0500',
  question_id: '2',
  user_id: 'nsf2',
  sent: false)

Schedule.create!(time:  '2014-02-03 12:00:00 -0500',
  question_id: '1',
  user_id: 'nsf3',
  sent: false)

Schedule.create!(time:  '2014-02-03 12:00:00 -0500',
  question_id: '2',
  user_id: 'nsf4',
  sent: false)

Schedule.create!(time:  '2014-02-03 12:00:00 -0500',
  question_id: '1',
  user_id: 'nsf5',
  sent: false)

Question.create!(question_text: "Question #1 Content Goes Here")

Question.create!(question_text: "Question #2 Content Goes Here")

Question.create!(question_text: "Question #3 Content Goes Here")

Question.create!(question_text: "Question #4 Content Goes Here")

Question.create!(question_text: "Question #5 Content Goes Here")

Choice.create!(question_id: '1',
  choice_id: '-1',
  choice_text: 'Refuse to Answer')

Choice.create!(question_id: '1',
  choice_id: '1',
  choice_text: 'Text for Question 1, Choice 1')

Choice.create!(question_id: '1',
  choice_id: '2',
  choice_text: 'Text for Question 1, Choice 2')

Choice.create!(question_id: '1',
  choice_id: '3',
  choice_text: 'Text for Question 1, Choice 3')

Choice.create!(question_id: '2',
  choice_id: '-1',
  choice_text: 'Refuse to Answer')

Choice.create!(question_id: '2',
  choice_id: '1',
  choice_text: 'Text for Question 2, Choice 1')

Choice.create!(question_id: '2',
  choice_id: '2',
  choice_text: 'Text for Question 2, Choice 2')

Choice.create!(question_id: '2',
  choice_id: '3',
  choice_text: 'Text for Question 2, Choice 3')

Choice.create!(question_id: '3',
  choice_id: '-1',
  choice_text: 'Refuse to Answer')

Choice.create!(question_id: '3',
  choice_id: '1',
  choice_text: 'Text for Question 3, Choice 1')

Choice.create!(question_id: '3',
  choice_id: '2',
  choice_text: 'Text for Question 3, Choice 2')

Choice.create!(question_id: '3',
  choice_id: '3',
  choice_text: 'Text for Question 3, Choice 3')

Choice.create!(question_id: '4',
  choice_id: '-1',
  choice_text: 'Refuse to Answer')

Choice.create!(question_id: '4',
  choice_id: '1',
  choice_text: 'Text for Question 4, Choice 1')

Choice.create!(question_id: '4',
  choice_id: '2',
  choice_text: 'Text for Question 4, Choice 2')

Choice.create!(question_id: '4',
  choice_id: '3',
  choice_text: 'Text for Question 4, Choice 3')

Choice.create!(question_id: '5',
  choice_id: '-1',
  choice_text: 'Refuse to Answer')

Choice.create!(question_id: '5',
  choice_id: '1',
  choice_text: 'Text for Question 5, Choice 1')

Choice.create!(question_id: '5',
  choice_id: '2',
  choice_text: 'Text for Question 5, Choice 2')

Choice.create!(question_id: '5',
  choice_id: '3',
  choice_text: 'Text for Question 5, Choice 3')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf1',
  question_id: '1',
  choice_id: '1')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf1',
  question_id: '2',
  choice_id: '3')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf2',
  question_id: '1',
  choice_id: '2')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf2',
  question_id: '2',
  choice_id: '1')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf3',
  question_id: '1',
  choice_id: '1')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf3',
  question_id: '2',
  choice_id: '3')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf4',
  question_id: '1',
  choice_id: '2')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf4',
  question_id: '2',
  choice_id: '2')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf5',
  question_id: '1',
  choice_id: '3')

Answer.create!(time: '2014-02-03 12:00:00 -0500',
  user_id: 'nsf5',
  question_id: '2',
  choice_id: '1')

Rule.create!(user_id: 'nsf2',
  peer_id: 'nsf1',
  delay: '120',
  question_id: '1')

Rule.create!(user_id: 'nsf1',
  peer_id: 'nsf3',
  delay: '120',
  question_id: '2')

Rule.create!(user_id: 'nsf4',
  peer_id: 'nsf3',
  delay: '120',
  question_id: '3')

Rule.create!(user_id: 'nsf3',
  peer_id: 'nsf5',
  delay: '120',
  question_id: '2')
