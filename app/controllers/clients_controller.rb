class ClientsController < ApplicationController

    def show
        client = Client.find(params[:id])
        total_cost = client.memberships.map{|membership| membership.charge}.sum
        client.total_cost = total_cost
        render json: client.total_cost, status: :ok
    end



    private
    def client_not_found
        render json: {errors: ["Client not found!"]}, status: :not_found
    end



    #
end
