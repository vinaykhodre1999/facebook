Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end
Rails.application.config.hosts << "http://localhost:3000"