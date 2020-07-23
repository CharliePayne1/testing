class ApplicationController < ActionController::API

    def secret
        ENV["SECRET"]
    end

    def generate_token(data)
        JWT.encode(data, secret)
    end

    def decode_token
        token = request.headers["Authorization"]
        begin
            JWT.decode(token, secret).first
        rescue
            {}
        end
    end
    
    def current_doctor
        id = decode_token["id"]
        Doctor.find_by(id: id)
    end

end

