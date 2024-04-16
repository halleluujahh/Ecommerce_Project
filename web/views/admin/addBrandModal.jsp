<%-- 
    Document   : addBrandModal
    Created on : Jan 27, 2024, 11:13:04 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBrandModalLabel">Add Brand Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addBrandForm" action="../admin/dashboard?action=add-brand" method="POST">
                    <div class="form-group">
                        <label for="brand">Brand: </label>
                        <input type="text" class="form-control" id="brandInput" name="brand">
                        <div id="brandError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addBrandForm" onclick="validateBrandForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    var error = "${errorba}";
    if (error) {
        alert("Error: " + error);
    }

    var msg = "${msgba}";
    if (msg) {
        alert("Success: " + msg);
    }

    function validateBrandForm() {
        let brand = $('#brandInput').val();
        //xoá thông báo lỗi hiện tại
        $('.error').html('');
        if (brand === '') {
            $('#brandError').html('Brand input cannot blank');
        } else if (!/^[A-Za-z\s{1,6}]+$/.test(brand.trim())) {
            $('#brandError').html('Brand input must contain only letters');
        }
        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this brand?')) {
                $('#addBrandForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }
</script>
