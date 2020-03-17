# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

org = Organization.create!(name: 'Fab Org')

year_1 = Year.create!(name: 2018, organization: org)
year_2 = Year.create!(name: 2019, organization: org)
year_3 = Year.create!(name: 2020, organization: org)
year_4 = Year.create!(name: 2021, organization: org)
year_5 = Year.create!(name: 2022, organization: org)

User.create!(
  organization: org,
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

course_1 = Course.create!(name: 'Course 1', organization: org, year: year_1)
course_2 = Course.create!(name: 'Course 3', organization: org, year: year_2)
course_3 = Course.create!(name: 'Course 3', organization: org, year: year_3)
course_4 = Course.create!(name: 'Course 4', organization: org, year: year_1)
course_5 = Course.create!(name: 'Course 5', organization: org, year: year_2)

Lab.create!(name: 'Lab 1', organization: org, course: course_1)
Lab.create!(name: 'Lab 2', organization: org, course: course_2)
Lab.create!(name: 'Lab 3', organization: org, course: course_3)
Lab.create!(name: 'Lab 4', organization: org, course: course_1)
Lab.create!(name: 'Lab 5', organization: org, course: course_2)

Student.create!(name: 'Stud 1', organization: org, course: course_1, username: 'user1', email: 'email1')
Student.create!(name: 'Stud 2', organization: org, course: course_1, username: 'user2', email: 'email2')
Student.create!(name: 'Stud 3', organization: org, course: course_1, username: 'user3', email: 'email3')
Student.create!(name: 'Stud 4', organization: org, course: course_2, username: 'user4', email: 'email4')
Student.create!(name: 'Stud 6', organization: org, course: course_2, username: 'user5', email: 'email5')
Student.create!(name: 'Stud 7', organization: org, course: course_3, username: 'user5', email: 'email5')
Student.create!(name: 'Stud 8', organization: org, course: course_4, username: 'user5', email: 'email5')

puts 'Seed created 5 of everything'
