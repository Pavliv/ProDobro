1.upto(2) do |i|
  News.create(title: "New title #{i}", description: Faker::Lorem.paragraph(i + 3))
end

admin = User.new(email: 'admin@admin.admin', password: '123123', name: 'admin', surname:'admin')
admin.add_role :admin
admin.save
