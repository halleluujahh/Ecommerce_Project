<%-- 
    Document   : deleteColorModal
    Created on : Jan 27, 2024, 9:18:40 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="changeStatusColorModal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label" style="color: black">Change Status Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to change status this color?</p>
            </div>
            <div class="modal-footer">
                <form action="../admin/dashboard?action=change-status-color" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idColorDeleteInput" name="colorId">
                        <input type="text" class="form-control" id="statusInput" name="status">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Confirm</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteColorModal(id, status) {
        $('#idColorDeleteInput').val(id);
        $('#statusInput').val(status);
    }
    var msg = "${msgcod}";
    if (msg) {
        alert("Success: " + msg);
    }
    var errorcod = "${errorcod}";
    if (errorcod) {
        alert("Error: " + errorcod);
    }
</script>
