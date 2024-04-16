<%-- 
    Document   : deleteGenderModal
    Created on : Jan 29, 2024, 4:07:12 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="changeStatusGenderModal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label" style="color: black">Change Status Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to change status this gender?</p>
            </div>
            <div class="modal-footer">
                <form action="../admin/dashboard?action=change-status-gender" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idGenderDeleteInput" name="genderId">
                        <input type="text" class="form-control" id="status2" name="status2">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Confirm</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteGenderModal(id, status2) {
        $('#idGenderDeleteInput').val(id);
        $('#status2').val(status2);
    }
    var msg = "${msggd}";
    if (msg) {
        alert("Success: " + msg);
    }
    var errorgd = "${errorgd}";
    if (errorgd) {
        alert("Error: " + errorgd);
    }
</script>
