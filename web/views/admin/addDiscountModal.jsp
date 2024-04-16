<%-- 
    Document   : addDiscountModal
    Created on : Feb 25, 2024, 5:45:09 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addDiscountModal" tabindex="-1" role="dialog" aria-labelledby="addDiscountModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addDiscountModalLabel">Add Discount Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addDiscountForm" action="../admin/dashboard?action=add-discount" method="POST">
                    <div class="form-group">
                        <label for="disc">Discount: </label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="discountInput" name="discount" required>
                            <div class="input-group-append">
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                        <div id="discountError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="status">Status: </label>
                        <select class="form-control" id="statusInput" name="status">
                            <option value="1">Active</option>
                            <option value="0">Inactive </option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addDiscountForm" onclick="validateAddDiscountForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    var errorad = "${errorad}";
    if (errorad) {
        alert("Error: " + errorad);
    }

    var msgad = "${msgad}";
    if (msgad) {
        alert("Success: " + msgad);
    }

    function validateAddDiscountForm() {
        let discount = $('#discountInput').val();
        // Clear current error messages
        $('.error').html('');
        if (discount === '') {
            $('#discountError').html('Discount input cannot be blank');
        } else if (!/^[0-9]+$/.test(discount.trim())) {
            $('#discountError').html('Discount input must contain only number');
        }
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this discount?')) {
                $('#addDiscountForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }

</script>
