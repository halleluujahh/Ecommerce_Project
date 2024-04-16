<%-- 
    Document   : editSizeModal
    Created on : Jan 29, 2024, 7:04:43 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editSizeModal" tabindex="-1" role="dialog" aria-labelledby="editSizeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editSizeModalLabel">Edit Size Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateSizeForm" action="../admin/dashboard?action=update-size" method="POST">
                    <input style="display: none" type="text" class="form-control" id="sizeIdToUpdate" name="sizeIdToUpdate">
                    <input style="display: none" type="text" class="form-control" id="oldSizeName" name="oldSizeName">
                    <div class="form-group">
                        <label for="size">Size: </label>
                        <input type="text" class="form-control" id="sizeToUpdate" name="sizeToUpdate">
                        <div id="sizeE" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="updateSizeForm" onclick="validateSizeForm2()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var msg = "${msgse}";
    if (msg) {
        alert("Success: " + msg);
    }
    
    var error = "${errorse}";
    if (error) {
        alert("Error: " + error);
    }
    
    function validateSizeForm2() {
        let size = $('#sizeToUpdate').val();
        // Clear current error messages
        $('.error').html('');
        if (size === '') {
            $('#sizeE').html('Size input cannot be blank');
        } else if (!/^[A-Za-z&-\s{1,6}]+$/.test(size.trim())) {
            $('#sizeE').html('Size input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update this size?')) {
                $('#updateSizeForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function editSizeModal(id, size) {
        $('#sizeIdToUpdate').val(id);
        $('#oldSizeName').val(size);
        $('#sizeToUpdate').val(size);
    }
</script>
