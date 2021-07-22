class SignupsController < ApplicationController

    def create
        signup = Signup.create!(signup_params)
        if signup 
            render json: signup.activity
        else
            render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end
    end 

    private

    def signup_params 
        params.permit(:time, :camper_id, :activity_id)
    end

end
