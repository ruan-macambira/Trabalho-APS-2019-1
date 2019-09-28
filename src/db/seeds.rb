# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  keywords = %w[computação pesquisa desenvolvimento]
  keywords.each do |word|
    Keyword.find_or_create_by! word: word
  end

  fields = ['Ciência da Computação']
  fields.each do |field|
    Field.find_or_create_by! name: field
  end

  10.times do
    ev_start = Faker::Date.between(from: Date.new(2019), to:Date.new(2020))
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
      field: Field.find(1),
      keywords: Keyword.all
    )
  end if Event.all.empty?

  Event.create!(
    name: 'Encontro de Computação',
    initials: 'ENECOMP',
    event_start: Date.new(2019, 10, 12),
    event_finish: Date.new(2019, 10, 15),
    submission_start: Date.new(2019, 9, 1),
    submission_finish: Date.new(2019, 9, 15),
    field: Field.find(1),
    keywords: Keyword.all
  ) if Event.where(initials: 'ENECOMP').empty?

  20.times do
    Author.create! name: Faker::Name.name, email: Faker::Internet.email
  end if Author.all.empty?

  10.times do
    user = [Student, Professor].sample
    user_info = {
      author: Author.all.sample,
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6),
      institution: Faker::University.name
    }
    user_info[:field] = Field.all.sample if user == Professor
    user_info[:registration] = Faker::Number.number.to_s if user == Student
    user.create!(user_info)
  end if User.all.empty?

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
