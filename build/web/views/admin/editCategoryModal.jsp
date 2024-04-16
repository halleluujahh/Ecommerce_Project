<%-- 
    Document   : editCategoryModal
    Created on : Jan 27, 2024, 10:09:40 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" role="dialog" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCategoryModalLabel">Edit Category Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateCategoryForm" action="../admin/dashboard?action=update-category" method="POST">
                    <input style="display: none" type="text" class="form-control" id="categoryIdToUpdate" name="categoryIdToUpdate">
                    <input style="display: none" type="text" class="form-control" id="oldNameCategory" name="oldNameCategory">
                    <div class="form-group">
                        <label for="category">Category: </label>
                        <input type="text" class="form-control" id="categoryToUpdate" name="categoryToUpdate">
                        <div id="cateE" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editCategoryForm" onclick="validateCategoryForm2()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var msg = "${msgce}";
    if (msg) {
        alert("Success: " + msg);
    }
    
    var error = "${errorce}";
    if (error) {
        alert("Error: " + error);
    }
    
    function validateCategoryForm2() {
        let cate = $('#categoryToUpdate').val();
        // Clear current error messages
        $('.error').html('');
        if (cate === '') {
            $('#cateE').html('Category input cannot be blank');
        } else if (!/^[A-Za-z&-\s{1,6}]+$/.test(cate.trim())) {
            $('#cateE').html('Category input must contain only letters');
        }
        // Check if there are no errors, then submit the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update this category?')) {
                $('#updateCategoryForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function editCategoryModal(id, category) {
        $('#categoryIdToUpdate').val(id);
        $('#oldNameCategory').val(category);
        $('#categoryToUpdate').val(category);
    }
</script>
