<%-- 
    Document   : editDiscountModal
    Created on : Feb 25, 2024, 6:43:45 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editDiscountModal" tabindex="-1" role="dialog" aria-labelledby="editDiscountModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editDiscountModalLabel">Edit Discount Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateDiscountForm" action="../admin/dashboard?action=update-discount" method="POST">
                    <input style="display: none" type="text" class="form-control" id="discountIdToUpdate" name="discountIdToUpdate">
                    <input style="display: none" type="text" class="form-control" id="oldDiscount" name="oldDiscount">
                    <div class="form-group">
                        <label for="username">Discount: </label>
                        <input type="text" class="form-control" id="discountPercentToUpdate" name="discountPercentToUpdate">
                        <div id="discountPercentE" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="status">Status: </label>
                        <select class="form-control" id="statusToUpdate" name="status">
                            <option value="1">Active</option>
                            <option value="0">Inactive </option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="updateDiscountForm" onclick="validateDiscountEditForm()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var selectElement = document.getElementById('statusToUpdate');

    if (selectElement.value === '1') {
        selectElement.selectedIndex = 0;
    } else {
        selectElement.selectedIndex = 1;
    }

    var msged = "${msged}";
    if (msged) {
        alert("Success: " + msged);
    }

    var errored = "${errored}";
    if (errored) {
        alert("Error: " + errored);
    }

    function validateDiscountEditForm() {
        let discount = $('#discountPercentToUpdate').val();
        // Clear current error messages
        $('.error').html('');
        if (discount === '') {
            $('#discountPercentE').html('Discount input cannot be blank');
        } else if (!/^[0-9\s{1,6}]+$/.test(discount.trim())) {
            $('#discountPercentE').html('Discount input must contain only number');
        }
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update this discount?')) {
                $('#updateDiscountForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function editDiscountModal(id, discount_percent, status) {
        $('#discountIdToUpdate').val(id);
        $('#discountPercentToUpdate').val(discount_percent);
        $('#oldDiscount').val(discount_percent);
        $('#statusToUpdate').val(status);
    }
</script>
