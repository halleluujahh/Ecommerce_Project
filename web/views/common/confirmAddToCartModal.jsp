<%-- 
    Document   : confirmAddToCartModal
    Created on : Mar 11, 2024, 9:30:50 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="confirmAddToCartModal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label" style="color: black">Add Product To Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h8>Are you sure you want to add this product detail of <span id="productName"></span> to cart?</h8>
            </div>
            <div class="modal-footer">
                <form action="product?action=add-products-to-cart" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idAccount" name="accountID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idProduct" name="productID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="productNameInput" name="productName">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="categoryIdInput" name="cateID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="brandIdInput" name="brandID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idColorInput" name="colorID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idSizeInput" name="sizeID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idGenderInput" name="genderID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="quantityInput1" name="quantityBuy">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="addressInput1" name="address">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Add</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function addProductToCartModal(acountid, address, id, productName, categoryId, brandId, colorId, sizeId, genderId, quantity) {
        $('#idAccount').val(acountid);
        $('#idProduct').val(id);
        $('#productNameInput').val(productName);
        $('#categoryIdInput').val(categoryId);
        $('#brandIdInput').val(brandId);
        $('#idColorInput').val(colorId);
        $('#idSizeInput').val(sizeId);
        $('#idGenderInput').val(genderId);
        $('#quantityInput1').val(quantity);
        $('#productName').text(productName);
        $('#addressInput1').val(address);
    }
</script>