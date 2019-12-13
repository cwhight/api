json.array! @documents do |document|
  json.extract! document, :title
end
