<div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to remove this product?</p>
                <!-- Form -->
                <form id="deleteProductForm" method="post" action="Checkout?action=deleteProduct">
                    <input type="hidden" name="p_id" id="productIdField" value="">
                    <input type="hidden" name="pd_id" id="productDetailIdField" value="">
                    <input type="hidden" name="cart_id" id="cartIdField" value="">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" form="deleteProductForm" id="confirmDelete">Confirm</button>
            </div>
        </div>
    </div>
</div>

<script>
    function openConfirmationModal(productId, productDetailId, cartId) {
        document.getElementById('productIdField').value = productId;
        document.getElementById('productDetailIdField').value = productDetailId;
        document.getElementById('cartIdField').value = cartId;
    }
</script>
