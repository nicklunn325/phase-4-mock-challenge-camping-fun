class ActivitiesController < ApplicationController

    def index
        render json: Activity.all
    end

    def destroy
        activity = find_activity
        # activity.signups.destroy_all
        activity.destroy
    end

    private
    
    def find_activity
        Activity.find(params[:id])
    end

    def record_not_found
        render json: {error: "Activity not found"}, status: :not_found
    end

end
