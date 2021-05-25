class Product < ApplicationRecord
    validates :nameproduct  ,   presence: true
    validates :unitprice    ,   presence: true
    
    class<< self
        def product_finder(product_name:)
            products    = Product.all
            unless product_name.nil?
                products    = products.where("lower(nameproduct) LIKE ?", "%" + product_name.downcase + "%") if product_name != ""
            end           
            products
        end
    end
end
