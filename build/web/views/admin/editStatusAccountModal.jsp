<%-- 
    Document   : editStatusAccountModal
    Created on : Mar 10, 2024, 10:01:51 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="modal fade" id="editStatusAccountModal" tabindex="-1" role="dialog" aria-labelledby="update-modal-label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="update-modal-label" style="color: black">Update Form</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to update status of this account?</p>
                </div>
                <div class="modal-footer">
                    <form action="dashboard?action=update-status-account" method="POST">
                        <div class="form-group" style="display: none">
                            <input type="text" class="form-control" id="idAccountEditStatusInput" name="accountID">
                        </div>
                        <div class="form-group" style="display: none">
                            <input type="text" class="form-control" id="statusAccountEditStatusInput" name="status">
                        </div>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function editStatusAccountModal(id, status) {
            $('#idAccountEditStatusInput').val(id);
            $('#statusAccountEditStatusInput').val(status);
        }
        var msgusa = "${msgusa}";
        if (msgusa) {
            alert("Success: " + msgusa);
        }

        var errusa = "${errusa}";
        if (errusa) {
            alert("Error: " + errusa);
        }
    </script>
</html>
