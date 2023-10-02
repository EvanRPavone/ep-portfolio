# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 10 Projects

User.create(email: 'admin@localhost.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Evan",
  last_name: "Pavone",
  username: "localhost",
  role: User.roles[:admin])

User.create(email: 'user@localhost.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Basic",
  last_name: "User",
  username: "basicUser")

10.times do |x|
  project= Project.create(title: "Project #{x}",
                          description: "Hello this is Project #{x}",
                          user_id: User.first.id)
  
  5.times do |y|
    Comment.create(body: "Hello #{User.first.username}",
                    user_id: User.second.id,
                    project_id: project.id)
  end
end