<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add Product Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="manageProduct?action=add-product" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="pname">Product Name: </label>
                        <input type="text" class="form-control" id="productnameInput" name="product_name">
                        <div id="productnameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="productDescription">Product Description: </label>
                        <input type="text" class="form-control" id="productdescriptionInput" name="productDescription">
                        <div id="productdescriptionError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="productPrice">Product Price: </label>
                        <input type="text" class="form-control" id="productpriceInput" name="productPrice">
                        <div id="productpriceError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="cateSelect">Category: </label>
                        <select class="form-control" id="cateSelect" name="cate" required>
                            <<option value="">Select category</option>
                            <c:forEach items="${listCategories}" var="cate">
                                <option value="${cate.id}">${cate.category}</option>
                            </c:forEach>
                        </select>
                        <div id="cateError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="brandSelect">Brand: </label>
                        <select class="form-control" id="brandSelect" name="brand" required>
                            <<option value="">Select brand</option>
                            <c:forEach items="${listBrands}" var="b">
                                <option value="${b.id}">${b.brand}</option>
                            </c:forEach>
                        </select>
                        <div id="brandError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="image">Product Image Layout: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload (*.png, *.jpg, *.jpeg)</span>
                            </div>
                            <div class="custom-file">
                                <input value="" accept="image/png, image/jpg, image/jpeg" type="file" class="custom-file-input" id="image" name="image" onchange="displayImage(this)" required>
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage" src="#" alt="Preview" style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                    <div id="imageError" class="error"></div>
                    <div class="form-group">
                        <label for="image">Product Images:</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload (*.png, *.jpg, *.jpeg)</span>
                            </div>
                            <div class="custom-file">
                                <input multiple="multiple" accept="image/png, image/jpg, image/jpeg" type="file" class="custom-file-input" id="list_image" name="list_image" onchange="displayImage2(this)">
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <div id="previewImagesContainer"></div>
                    </div>
                    <div id="imageError2" class="error"></div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="validateAddProductForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>

    var errorap = "${errorap}";
    if (errorap) {
        alert("Error: " + errorap);
    }

    var msgap = "${msgap}";
    if (msgap) {
        alert("Success: " + msgap);
    }

    function validateAddProductForm() {

        let productName = $('#productnameInput').val();
        let productDescription = $('#productdescriptionInput').val();
        let productPrice = $('#productpriceInput').val();
        let stock = $('#stockInput').val();
        let cateID = $('#cateSelect').val();
        let brandID = $('#brandSelect').val();
        let image = $('#image').val();
        let images = $('#list_image')[0].files;
        $('.error').html('');


        if (cateID === '') {
            $('#cateError').html('Please choose category!');
        }
        if (brandID === '') {
            $('#brandError').html('Please choose brand!');
        }
        if (image === '') {
            $('#imageError').html('Please choose image!');
        }
        if (images.length === 0) {
            $('#imageError2').html('Please choose at least one image!');
        } else if (images.length > 6) {
            $('#imageError2').html('Maximum of 6 images allowed!');
        }
        if (productName === '') {
            $('#productnameError').html('Product Name cannot be blank');
        } else if (productName.length < 3) {
            $('#productnameError').html('Product Name must be at least 3 characters long.');
        } else if (!/^(?!.*\s{2})(?!.*-{2})[A-Za-z0-9-\s]+$/.test(productName)) {
            $('#productnameError').html('Product Name must contain only letters');
        }

        if (productDescription === '') {
            $('#productdescriptionError').html('Product Description cannot be blank');
        } else if (productDescription.length < 10) {
            $('#productdescriptionError').html('Product Description must be at least 10 characters long.');
        } else if (!/^(?!.*\s{2})[A-Za-z0-9.,!@#$%&^*/()\[\]\"';:{}\s-]+$/.test(productDescription)) {
            $('#productdescriptionError').html('Product Description must contain only letters, numbers, and special characters');
        }


        if (productPrice === '') {
            $('#productpriceError').html('Product Price cannot be blank');
        } else if (!/^\d+(\.\d{1,2})?$/.test(productPrice) || parseFloat(productPrice) <= 0) {
            $('#productpriceError').html('Product Price must contain only numbers and larger than zero');
        }

        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to add this product?')) {
                $('#addProductForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }


    function displayImage(input) {
        var previewImage = document.getElementById("previewImage");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        };
        reader.readAsDataURL(file);
    }

    function displayImage2(input) {
        var previewImagesContainer = document.getElementById("previewImagesContainer");
        previewImagesContainer.innerHTML = "";

        for (var i = 0; i < input.files.length; i++) {
            var file = input.files[i];
            var reader = new FileReader();

            reader.onload = function (e) {
                var imageContainer = document.createElement("div");
                imageContainer.classList.add("imageContainer");

                var previewImage = document.createElement("img");
                previewImage.src = e.target.result;
                previewImage.alt = "Preview";

                imageContainer.appendChild(previewImage);
                previewImagesContainer.appendChild(imageContainer);
            };

            reader.readAsDataURL(file);
        }
    }
</script>
