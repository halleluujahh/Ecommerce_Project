<%-- 
    Document   : addGenderModal
    Created on : Jan 29, 2024, 3:55:26 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addGenderModal" tabindex="-1" role="dialog" aria-labelledby="addGenderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addGenderModalLabel">Add Gender Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addGenderForm" action="../admin/dashboard?action=add-gender" method="POST">
                    <div class="form-group">
                        <label for="gender">Gender: </label>
                        <input type="text" class="form-control" id="genderInput" name="gender">
                        <div id="genderError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addGenderForm" onclick="validateAddGenderForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    var error = "${errorga}";
    if (error) {
        alert("Error: " + error);
    }

    var msg = "${msgga}";
    if (msg) {
        alert("Success: " + msg);
    }

    function validateAddGenderForm() {
        let gender = $('#genderInput').val();
        // Clear current error messages
        $('.error').html('');
        if (gender === '') {
            $('#genderError').html('Gender input cannot be blank');
        } else if (!/^[A-Za-z\s{1,6}]+$/.test(gender.trim())) {
            $('#genderError').html('Gender input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this gender?')) {
                $('#addGenderForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }

</script>