namespace :db do
  desc "Fill db with fake sample data"
  task populate: :environment do
    User.create!( name: "Example User",
                  email: "example@railstutorial.org",
                  password: "foobar",
                  password_confirmation: "foobar",
                  admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
      puts "Created user #{name}"
    end

    users = User.all(limit: 10)
    3.times do
      users.each do |user| 
        name = Faker::Name.last_name
        make = %w[Honda Nissan Hyundai Toyota Mazda
          Vokswagen Audi BMW Mercedes LandRover ].sample(1)[0]
        model = ('A'..'Z').to_a.sample(1)[0] + rand(1..10).to_s
        user.vehicles.create!(name: name, 
                              make: make,
                              model: model,
                              year: rand(1970..Time.now.year+1),
                              odometer: rand(0..300000))
        puts "Created vehicle #{name} - #{make} - #{model}"
      end
    end
  end
end 