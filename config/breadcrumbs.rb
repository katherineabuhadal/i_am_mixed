crumb :forums do
  link "Forums", forums_path
end

crumb :forum do |forum|
  link forum.name, forum_path(forum)
  parent :forums
end

crumb :topic do |topic|
  link topic.name, forum_topic_path(topic.forum, topic)
  parent :forum, topic.forum
end
