class GymsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :gym_not_found
    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym - Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    def new_membership
        membership = Membership.create!(membership_params)
        if membership.valid?
            membership.save
            render json: membership, status: :created
        else
            render json: {errors: membership.errors.full_messages}, status: 422
        end
    end


    private
    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def gym_not_found
        render json: {errors: ["Gym was not found"]}, status: :not_found
    end


    #
end
