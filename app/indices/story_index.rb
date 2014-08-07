ThinkingSphinx::Index.define :story, with: :active_record do
  indexes title, sortable: true
  indexes body

  indexes tags.name, as: :tag, sortable: true
  indexes responses.body, as: :response_body, sortable: true

  has created_at, updated_at
end
