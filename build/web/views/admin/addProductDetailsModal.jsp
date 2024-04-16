<%-- 
    Document   : addProductDetailsModal
    Created on : Mar 8, 2024, 10:44:38 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addProductDetailsModal" tabindex="-1" role="dialog" aria-labelledby="addProductDetailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductDetailsModalLabel">Add Product Details Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductDetailsForm" action="manageproduct?action=add-product-details" method="POST" enctype="multipart/form-data">
                    <div class="form-group" style="display: none">
                        <label for="pid">Product ID: </label>
                        <input style="color: white" value="" type="text" class="form-control" id="productIdInput" name="productID" >
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="pname">Product Name: </label>
                        <input style="color: white" value="" type="text" class="form-control" id="productnameInput" name="product_name">
                    </div>
                    <div class="form-group">
                        <label for="cateSelect">Color: </label>
                        <select class="form-control" id="colorSelect" name="color" required>
                            <<option selected="" value="">Select Color</option>
                            <c:forEach items="${listColors}" var="c">
                                <option value="${c.id}">${c.color}</option>
                            </c:forEach>
                        </select>
                        <div id="colorError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="cateSelect">Size: </label>
                        <select class="form-control" id="sizeSelect" name="size" required>
                            <<option selected="" value="">Select Size</option>
                            <c:forEach items="${listSizes}" var="s">
                                <option value="${s.id}">${s.size}</option>
                            </c:forEach>
                        </select>
                        <div id="sizeError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="brandSelect">Gender: </label>
                        <select class="form-control" id="genderSelect" name="gender" required>
                            <<option value="">Select gender</option>
                            <c:forEach items="${listGenders}" var="g">
                                <option value="${g.id}">${g.gender}</option>
                            </c:forEach>
                        </select>
                        <div id="genderError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="stock">Stock: </label>
                        <input value="" type="text" class="form-control" id="stockInput" name="stock">
                        <div id="stockError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addProductDetailsForm" onclick="validateAddProductDetailsForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>

    var errorapd = "${errorapd}";
    if (errorapd) {
        alert("Error: " + errorapd);
    }

    var msgapd = "${msgapd}";
    if (msgapd) {
        alert("Success: " + msgapd);
    }

    function validateAddProductDetailsForm() {

        let stock = $('#stockInput').val();
        let colorID = $('#colorSelect').val();
        let sizeID = $('#sizeSelect').val();
        let genderID = $('#genderSelect').val();

        $('.error').html('');


        if (colorID === '') {
            $('#colorError').html('Please choose color!');
        }
        if (sizeID === '') {
            $('#sizeError').html('Please choose size!');
        }
        if (genderID === '') {
            $('#genderError').html('Please choose gender!');
        }

        if (stock === '') {
            $('#stockError').html('Stock cannot be blank');
        } else if (!/^[0-9]+$/.test(stock) || parseInt(stock) <= 0) {
            $('#stockError').html('Stock must contain only numbers and greater than zero');
        }

        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this product details?')) {
                $('#addProductDetailsForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }

    function addProductDetailsModal(id, productName) {
        $('#productIdInput').val(id);
        $('#productnameInput').val(productName);
    }

</script>

