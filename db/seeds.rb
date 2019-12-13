i = 1
require 'date'
10.times do
  Document.create( title: i, content: Faker::Lorem.sentence, created_at: DateTime.now - 3, updated_at: DateTime.now - 1 )
  doc = Document.last
  Revision.create(content: Faker::Lorem.sentence, created_at: DateTime.now - 3, updated_at: DateTime.now - 2, document: doc, title: doc.title)
  Revision.create(content: Faker::Lorem.sentence, created_at: DateTime.now - 2, updated_at: DateTime.now - 1, document: doc, title: doc.title)
  i += 1
end
