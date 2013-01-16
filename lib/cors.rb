class CrossOriginResourceSharingPolicy < Grape::Middleware::Base
  def append_cors_headers(headers)
    headers['Access-Control-Allow-Origin'] = env['HTTP_ORIGIN'] || '*'
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Max-Age'] = '86400'
    headers['Access-Control-Allow-Headers'] = 'Content-Type, RAVEL_API_TOKEN'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  end

  def call!(env)
    @env = env

    append_cors_headers_for_error(catch(:error){
      @app_response = @app.call(@env)
      append_cors_headers @app_response[1]
      return @app_response
    })
  end

  def append_cors_headers_for_error(error = {})
    error[:headers] ||= {}
    append_cors_headers(error[:headers] ||= {})
    # throw again to let Error middleware to handle it
    throw :error, error
  end
end

