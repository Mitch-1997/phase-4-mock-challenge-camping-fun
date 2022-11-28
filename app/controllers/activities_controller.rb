class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :e_nfound
 wrap_paramms = []
    def index
        a = Activity.all
        render json: a, status: :ok
    end

    def destroy
        a = Activity.find(params[:id])
        a.destroy
        head :no_content
    end

    private
    def e_nfound
        render json: {error: "Activity not found"}, status: :not_found
    end
end
