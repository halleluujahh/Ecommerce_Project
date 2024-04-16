<%-- 
    Document   : addCategoryModal
    Created on : Jan 27, 2024, 10:09:18 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add Category Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addCategoryForm" action="../admin/dashboard?action=add-category" method="POST">
                    <div class="form-group">
                        <label for="username">Category: </label>
                        <input type="text" class="form-control" id="cateInput" name="cate">
                        <div id="cateError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addCategoryForm" onclick="validateCateForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    var error = "${errorca}";
    if (error) {
        alert("Error: " + error);
    }

    var msg = "${msgca}";
    if (msg) {
        alert("Success: " + msg);
    }

    function validateCateForm() {
        let cate = $('#cateInput').val();
        //xoá thông báo lỗi hiện tại
        $('.error').html('');
        if (cate === '') {
            $('#cateError').html('Category input cannot blank');
        } else if (!/^[A-Za-z\s{1,6}]+$/.test(cate.trim())) {
            $('#cateError').html('Category input must contain only letters');
        }
        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this category?')) {
                $('#addCategoryForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }
</script>
