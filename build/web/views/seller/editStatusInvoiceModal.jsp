<%-- 
    Document   : editSizeModal
    Created on : Jan 29, 2024, 7:04:43 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editInvoiceModal" tabindex="-1" role="dialog" aria-labelledby="editInvoiceModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editInvoiceModal">Edit Status Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateStatusForm" action="../seller/manageInvoice?action=update-status" method="POST">
                    <input style="display: none" type="text" class="form-control" id="invoiceIdToUpdate" name="invoiceIdToUpdate">
                    <div class="form-group">
                        <label for="cateSelect">Status: </label>
                        <select class="form-control" id="statusSelect" name="status" required>
                            <option value="">Select status</option>
                            <c:forEach items="${listStatus}" var="s">
                                <option value="${s.id}">${s.status}</option>
                            </c:forEach>
                        </select>
                        <div style="color:red" id="statusError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="updateStatusForm" onclick="validateInvoiceForm2()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var msgei = "${msgei}";
    if (msgei) {
        alert("Success: " + msgei);
    }

    var errorei = "${errorei}";
    if (errorei) {
        alert("Error: " + errorei);
    }

    function validateInvoiceForm2() {
        let status = $('#statusSelect').val();
        // Clear current error messages
        $('.error').html('');
        if (status === '') {
            $('#statusError').html('Choose status!');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update status of this invoice?')) {
                $('#updateStatusForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function updateInvoice(id, status) {
        $('#invoiceIdToUpdate').val(id);
        var statusSelect = $('#statusSelect');
        statusSelect.empty();

        if (status === 'Pending') {
            statusSelect.append('<option value="">Choose status</option>');
            statusSelect.append('<option value="2">Delivery</option>');
            statusSelect.append('<option value="4">Cancel</option>');
        }
        if (status === 'Delivery') {
            statusSelect.append('<option value="">Choose status</option>');
            statusSelect.append('<option value="3">Complete</option>');
            statusSelect.append('<option value="4">Cancel</option>');
        }
    }
</script>
