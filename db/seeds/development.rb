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
                              website: "#",
                              twitter: "#",
                              instagram: "#",
                              discord: "#",
                              about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              aoe: "Full Stack Software Engineer",
                              country: "US",
                              role: User.roles[:admin])
puts "Starting project creation"
elapsed = Benchmark.measure do
  projects = []
  50.times do |x|
    project= Project.new(title: "Project #{x}", description: "#{x} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt eget nullam non nisi est sit amet facilisis magna. Nec nam aliquam sem et tortor.", user: admin)
    projects.push(project)
  end
  Project.import(projects, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"