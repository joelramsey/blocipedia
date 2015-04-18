require 'faker'

#Create Users
5.times do
  user = User.new(
    user_name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create Wikis
50.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end 
wikis = Wiki.all

# Create an admin user
 admin = User.new(
   user_name:     'Addy',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
# Create a premium user
premium = User.new(
   user_name:     'Prem',
   email:    'premium@example.com',
   password: 'helloworld',
   role:     'premium'
 )
premium.skip_confirmation!
premium.save!
 
# Create a standard user
standard = User.new(
   user_name:     'Stan',
   email:    'standard@example.com',
   password: 'helloworld',
   role: 'standard'
 )
standard.skip_confirmation!
standard.save! 

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"

