json.extract! comment, :id, :creator, :recipient, :project_id, :comment, :created_at, :updated_at
json.url comment_url(comment, format: :json)
