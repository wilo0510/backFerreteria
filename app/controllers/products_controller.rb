class ProductsController < ApplicationController
    rescue_from Exception do |e|
        render json: {error: e.message}, status: :internal_server_error
    end
    rescue_from ActiveRecord::RecordNotFound do |e|
        render json:{error: e.message},status: :not_found
    end
    rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
    end
    def search
        products = Product.product_finder(           
            product_name:       params[:product_name]            
        )
        render json: products, status: :ok 
    end

end