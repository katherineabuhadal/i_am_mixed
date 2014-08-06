module TagListable
  def tag_list
    tags.pluck(:name).join(", ")
  end

  def tag_list=(new_tag_name_list)
    tag_names = new_tag_name_list.split(", ")
    new_tags = tag_names.map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
    self.tags = new_tags
  end
end
