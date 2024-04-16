<%-- 
    Document   : editStatusProductDetailModal
    Created on : Mar 9, 2024, 10:51:44 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="editStatusProductDetailModal" tabindex="-1" role="dialog" aria-labelledby="update-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="update-modal-label" style="color: black">Update Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to update status of this product detail?</p>
            </div>
            <div class="modal-footer">
                <form action="manageProduct?action=update-status-product-detail" method="POST">
                    <div class="form-group" style="display:none">
                        <input type="text" class="form-control" id="idProductEditStatusInput" name="productID">
                    </div>
                    <div class="form-group" style="display:none">
                        <input type="text" class="form-control" id="Status" name="status">
                    </div>
                    <div class="form-group" style="display:none">
                        <input type="text" class="form-control" id="idProductDetailEditStatusInput" name="productDetailId">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function editStatusProductDetailModal(id, status, productDetailId) {
        $('#idProductEditStatusInput').val(id);
        $('#Status').val(status);
        $('#idProductDetailEditStatusInput').val(productDetailId);
    }
    var msguspd = "${msguspd}";
    if (msguspd) {
        alert("Success: " + msguspd);
    }
    
    var erruspd = "${erruspd}";
    if (erruspd) {
        alert("Error: " + erruspd);
    }
</script>
