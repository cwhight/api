if @revision
  json.extract! @revision, :title, :content, :created_at
else
  json.extract! @document, :title, :content, :created_at, :updated_at
end
