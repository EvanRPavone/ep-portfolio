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

  
elapsed = Benchmark.measure do
  projects = []
  admin = User.first
  basic = User.second
  100.times do |x|
    puts "Creating project #{x}"
    project= Project.new(title: "Project #{x}",
                            description: "Hello this is Project #{x}",
                            user: admin)
    
    2.times do |y|
      puts "Creating comment #{y} for project #{x}"
      comment = project.comments.build(body: "Hello #{User.first.username}",
                      user: basic)
    end
    projects.push(project)
  end
  Project.import(projects, recursive: true)
end

puts "Original Time: 19.611192448999645 seconds"
puts "New Elapsed Time: #{elapsed.real} seconds"
# puts "Created #{projects.count} projects and #{comments.count} comments in #{elapsed.real} seconds "