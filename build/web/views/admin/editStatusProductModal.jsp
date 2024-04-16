<%-- 
    Document   : deleteProductModal
    Created on : Feb 19, 2024, 2:57:19 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="editStatusProductModal" tabindex="-1" role="dialog" aria-labelledby="update-modal-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="update-modal-label" style="color: white">Update Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to update status of this product?</p>
            </div>
            <div class="modal-footer">
                <form action="manageproduct?action=update-status-product" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idProductEditStatusInput" name="product_ID">
                    </div>
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="statusProductEditStatusInput" name="product_status">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function editStatusProductModal(id, status, colorId, sizeId, genderId) {
        $('#idProductEditStatusInput').val(id);
        $('#statusProductEditStatusInput').val(status);
    }
    var msgusp = "${msgusp}";
    if (msgusp) {
        alert("Success: " + msgusp);
    }

    var errusp = "${errusp}";
    if (errusp) {
        alert("Error: " + errusp);
    }
</script>


