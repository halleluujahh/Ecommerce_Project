<%-- 
    Document   : deleteProductDetailsModal
    Created on : Mar 8, 2024, 11:09:09 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="deleteProductDetailsModal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label" style="color: white">Delete Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this product detail of <span id="productName"></span>?</p>
            </div>
            <div class="modal-footer">
                <form action="manageProduct?action=delete-product-details" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idProductDeleteInput" name="product_ID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idColorDeleteInput" name="color_ID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idSizeDeleteInput" name="size_ID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idGenderDeleteInput" name="gender_ID">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var msgdp = "${msgdp}";
        if (msgdp) {
            alert("Success: " + msgdp);
        }

        var errordp = "${errdp}";
        if (errordp) {
            alert("Error: " + errordp);
        }
    });

    function deleteProductDetailsModal(id, colorId, sizeId, genderId, productName) {
        $('#idProductDeleteInput').val(id);
        $('#idColorDeleteInput').val(colorId);
        $('#idSizeDeleteInput').val(sizeId);
        $('#idGenderDeleteInput').val(genderId);
        $('#productName').text(productName);
    }
</script>
