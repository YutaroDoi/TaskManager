user = User.create(name: "Example", email: "test@example.com")

100.times do |number|
    user.tasks.create!( name:  "Cleaning#{number}",
        description: "clean my room",
        expire:              Time.zone.now,
        status: :todo,
        label: "家事",
        priority: :low)
end