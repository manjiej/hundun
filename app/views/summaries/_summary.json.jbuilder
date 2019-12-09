json.extract! summary, :id, :article_id, :user_id, :title, :text, :created_at, :updated_at
json.url summary_url(summary, format: :json)
