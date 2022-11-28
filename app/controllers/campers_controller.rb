class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :e_found
rescue_from ActiveRecord::RecordInvalid, with: :e_invalid

    def index
        c = Camper.all
        render json: c, status: :ok
    end

    def show
        c = Camper.find_by!(id: params[:id])
        render json: c, serializer:CampusActivitySerializer, status: :ok
    end

    def create
        c = Camper.create!(c_params)
       render json: c, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status::unprocessable_entity
    end

    private
    def c_params
        params.permit(:name, :age)
    end

    def e_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def e_invalid
        render json: {errors: "validation errors"}, status: :unprocessable_entity
    end
end
