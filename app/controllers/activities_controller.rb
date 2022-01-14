class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        if @activity
            @activity.signups.destroy_all
            @activity.destroy
        end
    end

    private

    def set_activity
        @activity = Activity.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
    end
end
