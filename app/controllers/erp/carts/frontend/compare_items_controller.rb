module Erp
  module Carts
    module Frontend
      class CompareItemsController < Erp::Frontend::FrontendController

        # POST /cart_items
        # POST /cart_items.json
        def add_to_compare
          exist = Erp::Carts::CompareItem.where(product_id: params[:product_id]).where(compare_id: @compare.id)
          
          if exist.count == 0
            product = Erp::Products::Product.find(params[:product_id])
            @compare_item = @compare.compare_items.build(product: product)
        
            if @compare_item.save
              redirect_to erp_online_store.root_path
            end
          else
            redirect_to erp_online_store.root_path
          end
        end
        
      end
    end
  end
end
