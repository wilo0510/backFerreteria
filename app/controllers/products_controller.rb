class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
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
    def receipt
        @printer = Escpos::Printer.new
        @printer << "Some text"
        
        @printer.to_escpos('/dev/usb/lp0') # returns ESC/POS data ready to be sent to printer
        # on linux this can be piped directly to /dev/usb/lp0
        # with network printer sent directly to printer socket (see example below)
        # with serial port printer it can be sent directly to the serial port

        @printer.to_base64 # returns base64 encoded ESC/POS data
        render json:{data: "hello"},status: :ok
    end

end