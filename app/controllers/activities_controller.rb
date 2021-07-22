class ActivitiesController < ApplicationController

    def index
        activities = Activity.all  
        render json: activities
    end

    def destroy 
        activity = Activity.find(params[:id])
        if activity 
            activity.id.signups.destroy_all
            activity.destroy
            render json: {}, status: :no_content
        else 
            render json: { error: "Activity not found"}, status: :not_found
        end
    end  

    # private 

    # def activity_params

    # end 
end
