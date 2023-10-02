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
                              phone_number: "(919) 609-3402",
                              role: User.roles[:admin])
user = User.first_or_create!(email: "user@localhost.com",
                              password: "password",
                              password_confirmation: "password",
                              first_name: "Mike",
                              last_name: "Provolone",
                              phone_number: "(222) 222-2222")

Address.first_or_create!(street: "3544 Bainford Dr",
                        city: "Fuquay-Varina",
                        state: "NC",
                        zip: "27526",
                        country: "USA",
                        user: admin)

Address.first_or_create!(street: "103 Duden Ct, Apt B",
                        city: "Cary",
                        state: "NC",
                        zip: "27513",
                        country: "USA",
                        user: user)

Social.first_or_create!(github: "https://github.com/EvanRPavone",
                        linkedin: "https://www.linkedin.com/in/evan-pavone/",
                        youtube: "https://www.youtube.com/channel/UC_MeVjfn0SM5d44Ei3HQYgw",
                        user: admin)

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
                      user: user)
    end
    projects.push(project)
  end
  Project.import(projects, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"