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
                              role: User.roles[:admin])
                    
basic = User.first_or_create!(email: "user@localhost.com",
                              password: "password",
                              password_confirmation: "password",
                              first_name: "Mike",
                              last_name: "Provolone",
                              phone_number: "2222222222")

Location.first_or_create!(state: "NC",
                        country: "USA",
                        user: admin)

Location.first_or_create!(state: "NC",
                        country: "USA",
                        user: basic)

elapsed = Benchmark.measure do
  projects = []
  100.times do |x|
    puts "Creating project #{x}"
    project= Project.new(title: "Project #{x}",
                        description: "Hello this is Project #{x}",
                        user: admin)
    
    2.times do |y|
      puts "Creating comment #{y} for project #{x}"
      comment = project.comments.build(body: "Hello #{admin.first_name}",
                                      user: basic)
    end
    projects.push(project)
  end
  Project.import(projects, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"