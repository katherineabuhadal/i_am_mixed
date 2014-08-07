ThinkingSphinx::Index.define :response, with: :active_record do
  indexes body, sortable: true

  has created_at, updated_at
end
