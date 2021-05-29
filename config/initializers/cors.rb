Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://front-ferreteria-eyz4rlozo-wrpachonl.vercel.app'  
      resource '*',
        headers: :any,
        methods: [:get]
    end
  end