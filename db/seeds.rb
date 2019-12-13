i = 1
require 'date'
10.times do
  Document.create( title: i, content: Faker::Lorem.sentence, created_at: DateTime.now - 3 )
  doc = Document.last
  Revision.create(content: Faker::Lorem.sentence, created_at: DateTime.now - 2, document: doc)
  Revision.create(content: Faker::Lorem.sentence, created_at: DateTime.now - 1, document: doc)
  i += 1
end
