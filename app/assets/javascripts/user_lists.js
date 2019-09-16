window.UserLists = {};

UserLists.updateQuantity = function(product_id, quantity) {
    var div_product = $('#product_' + product_id);

    if (quantity >= 1) {
        div_product.find('.form-product-save').addClass('hide');
        div_product.find('.form-product-quantity').removeClass('hide');
        div_product.find('.quantity').text(quantity);
    } else {
        div_product.find('.form-product-save').removeClass('hide');
        div_product.find('.form-product-quantity').addClass('hide');
    }
};

