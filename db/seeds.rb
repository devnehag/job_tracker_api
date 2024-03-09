# Create Users
10.times do |i|
    user = User.create!(
      user_id: i + 1,
      username: Faker::Internet.username,
      password: Faker::Internet.password(min_length: 8),
      email: Faker::Internet.email
    )
    # Create Jobs for each User
    3.times do
      job = user.jobs.create!(
        name: Faker::Job.title,
        company: Faker::Company.name,
        status: ['Open', 'Closed'].sample
      ) 
      # Create Checklist for each Job
      checklist = job.create_checklist!(
        title: Faker::Lorem.sentence(word_count: 3)
      )
      # Create ChecklistItems for each Checklist
      5.times do
        checklist.checklist_items.create!(
          description: Faker::Lorem.sentence(word_count: 3),
          status: ['Open', 'Closed'].sample
        )
      end
    end
  end