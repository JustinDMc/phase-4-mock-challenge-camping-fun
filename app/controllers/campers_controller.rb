class CampersController < ApplicationController

    def index  
        campers = Camper.all  
        render json: campers
    end

    def create
        camper = Camper.create!(camper_params)
        if camper
            render json: camper
        else
            render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        camper = Camper.find(params[:id])
        if camper  
            render :json => camper.to_json(:include => :activities)
        else 
            render json: { error: "Camper not found"}, status: :not_found
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
