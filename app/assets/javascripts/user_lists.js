window.UserLists = {};

UserLists.updateQuantity = function(product_id, quantity, quantity_product_user_lists) {
    var div_product = $('#product_' + product_id);

    $('#quantity_product_user_lists').text(quantity_product_user_lists);
    
    if (quantity >= 1) {
        div_product.find('.form-product-save').addClass('hide');
        div_product.find('.form-product-quantity').removeClass('hide');
        div_product.find('.quantity').text(quantity);
    } else {
        div_product.find('.form-product-save').removeClass('hide');
        div_product.find('.form-product-quantity').addClass('hide');
    }
};
