class DoctorsController < ApplicationController
    
    def login
        doctor = Doctor.find_by(username: params[:username])
        if doctor && doctor.authenticate(params[:password])
            render json: { username: doctor.username, token: generate_token({ id: doctor.id})}
        else
            render json: { message: "Failure"}
        end
    end

    def validate
        doctor = current_doctor
        render json: { username: doctor.username, token: generate_token({ id: doctor.id})}
    end


    private

    def doctor_params
        params.require(:doctor).permit(:username)
    end

end

