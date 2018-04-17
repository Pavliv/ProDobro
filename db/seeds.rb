1.upto(2) do |i|
  News.create(title: "New title #{i}", description: Faker::Lorem.paragraph(i + 3))
end
