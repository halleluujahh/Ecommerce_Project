<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="receiveInvoiceModal" tabindex="-1" role="dialog" aria-labelledby="receive-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="receive-modal-label" style="color: black">Confirmation Received Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Have you received your package?</p>
            </div>
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/home?action=receive-invoice" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idInvoiceReceiveInput" name="invoiceId">
                    </div>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Receive</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Function to set the value of idInvoiceReceiveInput
    function receiveInvoiceModal(id) {
        $('#idInvoiceReceiveInput').val(id);
    }
    
    // JavaScript to handle alerts
    var msg = "${msgri}";
    if (msg) {
        alert("Success: " + msg);
    }
    var errorcd = "${errorri}";
    if (errorcd) {
        alert("Error: " + errorcd);
    }
</script>
