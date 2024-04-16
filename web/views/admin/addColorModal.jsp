<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addColorModal" tabindex="-1" role="dialog" aria-labelledby="addColorModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addColorModalLabel">Add Color Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addColorForm" action="../admin/dashboard?action=add-color" method="POST">
                    <div class="form-group">
                        <label for="username">Color: </label>
                        <input type="text" class="form-control" id="colorInput" name="color">
                        <div id="colorError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addColorForm" onclick="validateForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    var error = "${errorcoa}";
    if (error) {
        alert("Error: " + error);
    }

    var msg = "${msgcoa}";
    if (msg) {
        alert("Success: " + msg);
    }

    function validateForm() {
        let color = $('#colorInput').val();
        // Clear current error messages
        $('.error').html('');
        if (color === '') {
            $('#colorError').html('Color input cannot be blank');
        } else if (!/^[A-Za-z\s{1,6}]+$/.test(color.trim())) {
            $('#colorError').html('Color input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this color?')) {
                $('#addColorForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }

</script>