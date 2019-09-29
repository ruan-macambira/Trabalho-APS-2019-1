# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  puts 'keywords...'
  keywords = %w[computação pesquisa desenvolvimento qualidade ia arquitetura]
  keywords.each do |word|
    Keyword.find_or_create_by! word: word
  end

  puts 'fields...'
  fields = [
    'NOFIELD',
    'Ciência da Computação', 'Qualidade de Software',
    'Engenharia de Software', 'Inteligência Artificial'
  ]
  fields.each do |field|
    Field.find_or_create_by! name: field
  end

  Professor.create!(
    name: 'admin',
    email: 'admin@admin.com',
    password: '123456',
    role: :admin,
    field: Field.first
  )

  Professor.create!(
    name: 'professor',
    email: 'prof@prof.com',
    password: '123456',
    field: Field.first
  )

  Student.create!(
    name: 'student',
    email: 'stud@stud.com',
    password: '123456'
  )

  puts 'events...'
  10.times do
    ev_start = Faker::Date.between(from: Date.new(2019), to: Date.new(2020))
    ev_finish = ev_start.advance(days: 7)
    sb_start = ev_start.advance(month: -1)
    sb_finish = sb_start.advance(days: 15)
    Event.create!(
      name: Faker::Lorem.sentence,
      initials: Faker::Name.initials,
      event_start: ev_start,
      event_finish: ev_finish,
      submission_start: sb_start,
      submission_finish: sb_finish,
      field: Field.all.sample,
      keywords: Keyword.all.sample(2)
    )
  end if Event.all.empty?

  Event.create!(
    name: 'Encontro de Computação',
    initials: 'ENECOMP',
    event_start: Date.new(2019, 10, 12),
    event_finish: Date.new(2019, 10, 15),
    submission_start: Date.new(2019, 9, 1),
    submission_finish: Date.new(2019, 9, 15),
    field: Field.first,
    keywords: Keyword.all.where(id: 1..3)
  ) if Event.where(initials: 'ENECOMP').empty?

  puts 'authors...'
  20.times do
    Author.create! name: Faker::Name.name, email: Faker::Internet.email
  end if Author.all.count == 1

  puts 'students and professors...'
  10.times do
    user = [Student, Professor].sample
    user_info = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6),
      institution: Faker::University.name
    }
    user_info[:field] = Field.all.sample if user == Professor
    user_info[:registration] = Faker::Number.number.to_s if user == Student
    user.create!(user_info)
  end if User.all.count == 1

  puts 'articles...'
  10.times do
    Article.create!(
      event: Event.all.sample,
      user: User.all.sample,
      title: Faker::Lorem.sentence,
      abstract: Faker::Lorem.paragraph,
      authors: Author.all.sample(rand(1..4)),
      users: [Professor.all.sample]
    )
  end if Article.all.empty?
end
