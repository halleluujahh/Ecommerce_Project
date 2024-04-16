<%-- 
    Document   : editGenderModal
    Created on : Jan 29, 2024, 4:07:20 PM
    Author     : LENOVO
--%>

<%-- 
    Document   : editBrandModal
    Created on : Jan 27, 2024, 11:16:06 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="editGenderModal" tabindex="-1" role="dialog" aria-labelledby="editGenderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editGenderModalLabel">Edit Gender Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateGenderForm" action="../admin/dashboard?action=update-gender" method="POST">
                    <input style="display: none" type="text" class="form-control" id="genderIdToUpdate" name="genderIdToUpdate">
                    <input style="display: none" type="text" class="form-control" id="oldGenderName" name="oldGenderName">
                    <div class="form-group">
                        <label for="username">Gender: </label>
                        <input type="text" class="form-control" id="genderToUpdate" name="genderToUpdate">
                        <div id="genderE" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="updateGenderForm" onclick="validateGenderForm2()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var msg = "${msgge}";
    if (msg) {
        alert("Success: " + msg);
    }

    var error = "${errorge}";
    if (error) {
        alert("Error: " + error);
    }

    function validateGenderForm2() {
        let gender = $('#genderToUpdate').val();
        // Clear current error messages
        $('.error').html('');
        if (gender === '') {
            $('#genderE').html('Gender input cannot be blank');
        } else if (!/^[A-Za-z\s{1,6}]+$/.test(gender.trim())) {
            $('#genderE').html('Gender input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update this gender?')) {
                $('#updateGenderForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function editGenderModal(id, gender) {
        $('#genderIdToUpdate').val(id);
        $('#oldGenderName').val(gender);
        $('#genderToUpdate').val(gender);
    }
</script>

