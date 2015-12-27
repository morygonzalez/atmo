module Atmo
  class Api
    def authenticate
      if @access_token && @expires_at > Time.now
        return true
      else
        get_token
      end
    end

    def get_token
      if @refresh_token
        response = connection.post '/oauth2/token' do |request|
          request.body = {
            grant_type: :refresh_token,
            refresh_token: @refresh_token,
            client_id: ENV['CLIENT_ID'],
            client_secret: ENV['CLIENT_SECRET']
          }
        end
      else
        response = connection.post '/oauth2/token' do |request|
          request.body = {
            grant_type: :password,
            client_id: ENV['CLIENT_ID'],
            client_secret: ENV['CLIENT_SECRET'],
            username: ENV['USERNAME'],
            password: ENV['PASSWORD'],
            scope: 'read_station read_thermostat'
          }
        end
      end
      store_token(response)
    end

    def get_station_data
      response = connection.get '/api/getstationsdata',  access_token: @access_token

      if response.status == 200
        data = JSON.parse(response.body)
        data
      else
        raise "Unauthenticated"
      end
    end

    private

    def connection
      @connection ||= Faraday::Connection.new(url: 'https://api.netatmo.net') do |builder|
        builder.request  :url_encoded
        # builder.response :logger
        builder.adapter  :net_http
      end
    end

    def store_token(response)
      if response.status == 200
        data = JSON.parse(response.body)
        @access_token = data['access_token']
        @refresh_token = data['refresh_token']
        @expires_at = Time.now + data['expires_in']
      end
    end
  end
end
