# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

::PaperTrail.request.controller_info = {event_source: "rails db:seed"}

Post.find_or_create_by(title: "Sample Post", body: "Sample Body")
Post.find_or_create_by(title: "All the post", body: "The post can not fit on the screen")
Post.find_or_create_by(title: "Last Post", body: "May the post be with you.")

User.find_or_create_by!(email: "admin@example.com") do |user|
  user.attributes = {
    role: :developer,
    password: "12345678",
    password_confirmation: "12345678"
  }
end

User.roles.each do |role, _|
  User.find_or_create_by!(email: "#{role}@example.com") do |user|
    user.attributes = {
      role: role,
      password: "12345678",
      password_confirmation: "12345678"
    }
  end
end
