i = 1
require 'date'
10.times do
  Document.create( title: i, content: Faker::Lorem.sentence, created_at: DateTime.now - 3 )
  doc = Document.last

  i += 1
end
