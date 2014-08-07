ThinkingSphinx::Index.define :tag, with: :active_record do
  indexes name, sortable: true

  has created_at, updated_at
end
