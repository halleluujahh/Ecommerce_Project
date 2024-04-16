<%-- 
    Document   : deleteCategoryModal
    Created on : Jan 27, 2024, 10:09:29 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="changeStatusCategoryModal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label" style="color: black">Change Status Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to change status this category?</p>
            </div>
            <div class="modal-footer">
                <form action="../admin/dashboard?action=change-status-category" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idCateDeleteInput" name="categoryId">
                        <input type="text" class="form-control" id="status1" name="status">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Confirm</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteCategoryModal(id, status1) {
        $('#idCateDeleteInput').val(id);
        $('#status1').val(status1);
    }
    var msg = "${msgcd}";
    if (msg) {
        alert("Success: " + msg);
    }
    var errorcd = "${errorcd}";
    if (errorcd) {
        alert("Error: " + errorcd);
    }
</script>
