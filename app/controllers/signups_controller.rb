class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :error_invalid
    wrap_parameters format:[]
   
    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    end

    private
    def error_invalid
        render json: {error: "validation errors"}, status: :unprocessable_entity
    end

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

end
