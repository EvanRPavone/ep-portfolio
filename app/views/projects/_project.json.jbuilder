json.extract! project, :id, :title, :description, :user_id, :github, :website, :youtube, :created_at, :updated_at
json.url project_url(project, format: :json)
json.description project.description.to_s
