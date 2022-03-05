class Api::V1::WeathersController < ApplicationController
    protect_from_forgery with: :null_session

    def create
        unless params[:date] and params[:lat] and params[:lon] and params[:city] and params[:state] and params[:temperatures]
            render json: { success: false, message: "Missing Params" }, status: 400
            return
        end
        @weather = Weather.new(weather_params)
        if @weather.save
          res = { weather: @weather, message: "created" }
          render json: res, status: 201
        else
          res = { message: "Invalid parameters" }
          render json: res, status: 400
        end
    end
    
    def index
        order_by="id ASC"
        cities_filter_array=[]

        # filter by city
        if params[:city]
            cities_filter_array = params[:city].downcase.split(',')
        end    

        # sort_on date & validate sort param
        if params[:sort]
            if params[:sort] == "date"
                order_by = "date ASC, id ASC" 
            elsif params[:sort] == "-date"
                order_by = "date DESC, id ASC" 
            else
                render json: { message: "Invalid sort parameter"}, status: 400 
                return  
            end           
        end

        if cities_filter_array.any?
            @weather_records = Weather.all.where('city IN (?)', cities_filter_array).order(order_by)  
        else
            @weather_records = Weather.all.order(order_by) 
        end   

        render json: @weather_records, status: 200
    end   

    def show
        @is_exist = Weather.exists?(id: params[:id])
        if @is_exist
            @weather = Weather.find_by!(id: params[:id])
            render json: @weather, status: 200
        else
            render json: { message: "No weather found with this id"}, status: 404
        end    
    end

    def update
        @is_exist = Weather.exists?(id: params[:id])
        if @is_exist
          @weather = Weather.find_by!(id: params[:id])
          @weather.update_attributes(weather_params)
          res = { weather: @weather, message: "weather updated successfully" }
          render json: res, status: 200
        else
          res = { message: "Not found weather having this id" }
          render json: res, status: 404
        end
    end

    def destroy
        @is_exist = Weather.exists?(id: params[:id])
        if @is_exist
          @weather = Weather.find(params[:id])
          @weather.destroy
          res = { message: "weather deleted successfully" }
          render json: res, status: 200
        else
          res = { message: "Not found weather having this id" }
          render json: res, status: 404
        end
    end

    private

    def weather_params
        params.permit(
          :date,
          :lat,
          :lon,
          :city,
          :state,
          temperatures: []
        )
    end
end
