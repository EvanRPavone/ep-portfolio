# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 10 Projects
10.times do |x|
    Project.create(title: "Title #{x}", description: "Hello Project #{x}", user_id: 1, github: "https://github.com/EvanRPavone", website: "https://github.com/EvanRPavone", youtube:"https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley")
end

# Create development admin
User.create(id: 1, email: "admin@localhost.com", password: "password", role: "Admin", first_name: "Admin", last_name: "Local", username: "localhost")

#Create development user
User.create(id: 2, email: "user@localhost.com", password: "password", role: "User", first_name: "Basic", last_name: "User", username: "BasicUser")