json.extract! summary, :id, :user_id, :title, :text, :digest, :created_at, :updated_at
json.url summary_url(summary, format: :json)
