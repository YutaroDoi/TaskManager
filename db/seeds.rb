100.times do |number|
    Task.create!(name:  "Cleaning#{number}",
        description: "clean my room",
        expire:              Time.zone.now,
        status: :todo,
        label: "家事",
        priority: :low)
end