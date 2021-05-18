class ProductsController < ApplicationController
    def search
        render json: {api: 'Buscando producto'}, status: :ok 
    end

end