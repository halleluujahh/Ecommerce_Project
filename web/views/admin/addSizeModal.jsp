<%-- 
    Document   : addSizeModal
    Created on : Jan 29, 2024, 7:04:27 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addSizeModal" tabindex="-1" role="dialog" aria-labelledby="addSizeModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSizeModalLabel">Add Size Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addSizeForm" action="../admin/dashboard?action=add-size" method="POST">
                    <div class="form-group">
                        <label for="size">Size: </label>
                        <input type="text" class="form-control" id="sizeInput" name="size">
                        <div id="sizeError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addSizeForm" onclick="validateAddSizeForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    var error = "${errorsa}";
    if (error) {
        alert("Error: " + error);
    }

    var msg = "${msgsa}";
    if (msg) {
        alert("Success: " + msg);
    }

    function validateAddSizeForm() {
        let size = $('#sizeInput').val();
        // Clear current error messages
        $('.error').html('');
        if (size === '') {
            $('#sizeError').html('Size input cannot be blank');
        } else if (!/^[A-Za-z\s{1,6}]+$/.test(size.trim())) {
            $('#sizeError').html('Size input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this size?')) {
                $('#addSizeForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }

</script>
