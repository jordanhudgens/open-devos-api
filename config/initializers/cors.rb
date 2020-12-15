Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://www.opendevos.com'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins 'http://www.opendevos.com'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins(/\Ahttps?:\/\/([a-zA-Z\d-]+\.){0,}localhost:\d*\/?\z/)
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins 'http://127.0.0.1:5500'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins(/https?:\/\/[\S]+/)
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end
