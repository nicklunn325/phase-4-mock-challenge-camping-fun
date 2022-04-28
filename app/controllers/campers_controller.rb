class CampersController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    def index 
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        # camper = Camper.find_by_id(params[:id])
        # if camper
            render json: camper, serializer: CamperWithActivitiesSerializer
        # else
        #     render json: {error: "Camper not found"}, status: :not_found
        # end
    end

    def create 
        # byebug
        # camper = Camper.new(name: params[:name], age: params[:age])
        # initialized our camper
        camper = Camper.create!(camper_params)
        # if camper.valid?
            render json: camper, status: :created
        # else
        #     render json: {errors: camper.errors.full_messages}, status: :unprocessable_entity
        # end

    
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    # def invalid_record(e)
    #     render json: {errors: e.record.errors.full_messages}, status: 422
    # end
    # def find_camper
    #     Camper.find(params[:id])
    # end

    def record_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end
end



# creating a camper 
# define a route - done in routes 
# 

