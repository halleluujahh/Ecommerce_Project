<%-- 
    Document   : editBrandModal
    Created on : Jan 27, 2024, 11:16:06 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="editBrandModal" tabindex="-1" role="dialog" aria-labelledby="editBrandModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editBrandModalLabel">Edit Brand Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateBrandForm" action="../admin/dashboard?action=update-brand" method="POST">
                    <input style="display: none" type="text" class="form-control" id="brandIdToUpdate" name="brandIdToUpdate">
                    <input style="display: none" type="text" class="form-control" id="oldBrandName" name="oldBrandName">
                    <div class="form-group">
                        <label for="username">Brand: </label>
                        <input type="text" class="form-control" id="brandToUpdate" name="brandToUpdate">
                        <div id="brandE" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editBrandForm" onclick="validateBrandForm2()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var msg = "${msgbe}";
    if (msg) {
        alert("Success: " + msg);
    }
    
    var error = "${errorbe}";
    if (error) {
        alert("Error: " + error);
    }
    
    function validateBrandForm2() {
        let brand = $('#brandToUpdate').val();
        // Clear current error messages
        $('.error').html('');
        if (brand === '') {
            $('#brandE').html('Brand input cannot be blank');
        } else if (!/^[A-Za-z&-\s{1,6}]+$/.test(brand.trim())) {
            $('#brandE').html('Brand input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update this brand?')) {
                $('#updateBrandForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function editBrandModal(id, brand) {
        $('#brandIdToUpdate').val(id);
        $('#oldBrandName').val(brand);
        $('#brandToUpdate').val(brand);
    }
</script>
