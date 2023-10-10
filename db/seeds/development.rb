# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding development database..."
admin = User.first_or_create!(email: "admin@localhost.com",
                              password: "password",
                              password_confirmation: "password",
                              first_name: "Evan",
                              last_name: "Pavone",
                              phone_number: "9196093402",
                              github: "https://github.com/EvanRPavone",
                              linkedin: "https://www.linkedin.com/in/evan-pavone/",
                              youtube: "https://www.youtube.com/channel/UC_MeVjfn0SM5d44Ei3HQYgw",
                              about: Faker::Lorem.paragraph(sentence_count: 5),
                              aoe: "Full Stack Software Engineer",
                              country: "US",
                              role: User.roles[:admin])
elapsed = Benchmark.measure do
  projects = []
  puts "Starting project creation"
  50.times do |x|
    project= Project.new(title: "#{x} #{Faker::Lorem.sentence(word_count: 3)}", description: "#{x} #{Faker::Lorem.paragraph(sentence_count: 5)}", user: admin)
    projects.push(project)
  end
  Project.import(projects, recursive: true)
  puts "Creating Late Night Ideas..."
  
  10.times do 
    LateNightIdea.create(idea: Faker::Lorem.sentence(word_count: 3), user: admin)
  end
end


puts "Seeded development DB in #{elapsed.real} seconds"