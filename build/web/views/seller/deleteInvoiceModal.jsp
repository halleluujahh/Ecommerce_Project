<%-- 
    Document   : deleteCategoryModal
    Created on : Jan 27, 2024, 10:09:29 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="deleteInvoiceModal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label" style="color: black">Delete Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this invoice?</p>
            </div>
            <div class="modal-footer">
                <form action="../seller/manageInvoice?action=delete-invoice" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idInvoiceDeleteInput" name="invoiceID">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteInvoiceModal(id) {
        $('#idInvoiceDeleteInput').val(id);
    }
    var msg = "${msgdi}";
    if (msg) {
        alert("Success: " + msg);
    }
    var errorcd = "${errordi}";
    if (errorcd) {
        alert("Error: " + errorcd);
    }
</script>
