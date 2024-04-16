<%-- 
    Document   : editColorModal
    Created on : Jan 27, 2024, 9:34:05 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editColorModal" tabindex="-1" role="dialog" aria-labelledby="editColorModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editColorModalLabel">Edit Color Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateColorForm" action="../admin/dashboard?action=update-color" method="POST">
                    <input style="display: none" type="text" class="form-control" id="colorIdToUpdate" name="colorIdToUpdate">
                    <input style="display: none" type="text" class="form-control" id="oldNameColor" name="oldNameColor">
                    <div class="form-group">
                        <label for="username">Color: </label>
                        <input type="text" class="form-control" id="colorToUpdate" name="colorToUpdate">
                        <div id="colorE" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="updateColorForm" onclick="validateColorForm2()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var msg = "${msgcoe}";
    if (msg) {
        alert("Success: " + msg);
    }

    var error = "${errorcoe}";
    if (error) {
        alert("Error: " + error);
    }
    
    function validateColorForm2() {
        let color = $('#colorToUpdate').val();
        // Clear current error messages
        $('.error').html('');
        if (color === '') {
            $('#colorE').html('Color input cannot be blank');
        } else if (!/^[A-Za-z\s{1,6}]+$/.test(color.trim())) {
            $('#colorE').html('Color input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update this color?')) {
                $('#updateColorForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function editColorModal(id, color) {
        $('#colorIdToUpdate').val(id);
        $('#oldNameColor').val(color);
        $('#colorToUpdate').val(color);
    }
</script>
