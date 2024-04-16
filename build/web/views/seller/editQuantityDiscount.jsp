<%-- 
    Document   : editStatusProductDetailModal
    Created on : Mar 9, 2024, 10:51:44 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="settingDiscountModal" tabindex="-1" role="dialog" aria-labelledby="update-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="update-modal-label" style="color: black">Update Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateQuantityForm" action="../seller/dashboard?action=update-quantity-discount" method="POST">
                    <div class="form-group" style="display:none">
                        <input type="text" class="form-control" id="idDiscountInput" name="discountID">
                    </div>
                    <div class="form-group" style="color: black">
                        <label>Enter quantity:</label>
                        <input type="text" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity">
                    </div>
                    <div id="quantityErrorUpdate" style="color:red"></div>
                    <button type="button" class="btn btn-primary text-center" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger text-center" onclick="validateQuantityForm(event)">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function editQuantityDiscountModal(id) {
        $('#idDiscountInput').val(id);
    }
    var msguqd = "${msguqdiscount}";
    if (msguqd) {
        alert("Success: " + msguqd);
    }

    var erruqd = "${erruqdiscount}";
    if (erruqd) {
        alert("Error: " + erruqd);
    }

    function validateQuantityForm(event) {
        event.preventDefault();
        let quantity = $('#quantity').val().trim();
        $('#quantityErrorUpdate').html('');
        if (quantity === '') {
            $('#quantityErrorUpdate').html('Quantity input cannot be blank');
        } else if (!/^[0-9]+$/.test(quantity)) {
            $('#quantityErrorUpdate').html('Quantity input must contain only numbers');
        }

        if ($('#quantityErrorUpdate').html() === '') {
            if (confirm('Are you sure you want to update the quantity of this discount?')) {
                $('#updateQuantityForm').submit();
            }
        }
    }

</script>
