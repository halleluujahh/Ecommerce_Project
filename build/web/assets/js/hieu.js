
document.addEventListener('DOMContentLoaded', function () {
    const quantityInputs = document.querySelectorAll('.input_number');
    const incrementButtons = document.querySelectorAll('.input_number_increment_in');
    const decrementButtons = document.querySelectorAll('.input_number_decrement_de');
    const totalPrices = document.querySelectorAll('.total_price');
    const couponOption = document.querySelector('.coupon');


    quantityInputs.forEach(function (input) {
        input.addEventListener('input', function () {
            updateTotalPrice(this);
        });
    });

    incrementButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            const input = this.parentNode.querySelector('.input_number');
            input.stepUp();
            updateTotalPrice(input);
        });
    });

    decrementButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            const input = this.parentNode.querySelector('.input_number');
            input.stepDown();
            updateTotalPrice(input);
        });
    });


    function updateTotalPrice(input) {

        const row = input.closest('tr');
        const priceText = row.querySelector('.price_text').innerText;
        const price = parseFloat(priceText.substring(0, priceText.length - 1));
        const quantity = parseFloat(input.value);
        const totalPrice = price * quantity;
        row.querySelector('.total_price').innerText = totalPrice.toFixed(1) + 'VND';

        const stockText = row.querySelector('.stock_text').innerText;
        const stock = parseInt(stockText);
        const remainingStock = stock - quantity;
        row.querySelector('.remaining_stock').innerText = remainingStock + ' product left';

        let totalPriceSum = 0;

        totalPrices.forEach(function (totalPrice) {
            const parsedPrice = parseFloat(totalPrice.innerText.replace('VND', ''));
            console.log('Parsed price:', parsedPrice);
            if (!isNaN(parsedPrice)) {
                totalPriceSum += parsedPrice;
            }
        });

        // Display the total sum
        const totalSumElement = document.getElementById('total_price_sum');
        totalSumElement.innerText = totalPriceSum.toFixed(1) + 'VND';

        // Parse the discount value
        const couponOptionValue = couponOption.value;
        const discountValueElement = document.getElementById('discount_value');
        discountValueElement.textContent = couponOptionValue + "%";
        const discountValueText = discountValueElement.innerText;
        const discountValue = parseFloat(discountValueText.substring(0, discountValueText.length - 1));

        // Calculate the final total
        const finalTotal = totalPriceSum - (totalPriceSum * discountValue / 100);
        const finalTotalElement = document.getElementById('total_price_final');
        finalTotalElement.innerText = finalTotal.toFixed(1) + 'VND';

        const tps_textCont = document.getElementById("total_price_sum").textContent;
        const tps_textCont_float = parseFloat(tps_textCont.substring(0, tps_textCont.length - 3));
        document.getElementById("tps_value_input").value = tps_textCont_float;

        const dvi_textCont = document.getElementById("discount_value").textContent;
        const dvi_textCont_float = parseFloat(dvi_textCont.substring(0, dvi_textCont.length - 1));
        document.getElementById("dis_value_input").value = dvi_textCont_float;

        const tpf_textCont = document.getElementById("total_price_final").textContent;
        const tpf_textCont_float = parseFloat(tpf_textCont.substring(0, tpf_textCont.length - 3));
        document.getElementById("tpf_value_input").value = tpf_textCont_float;
    }

});

document.addEventListener('DOMContentLoaded', function () {
    const totalPrices = document.querySelectorAll('.total_price');
    const couponOption = document.querySelector('.coupon');
    let totalPriceSum = 0;

    totalPrices.forEach(function (totalPrice) {
        const parsedPrice = parseFloat(totalPrice.innerText.replace('$', ''));
        console.log('Parsed price:', parsedPrice);
        if (!isNaN(parsedPrice)) {
            totalPriceSum += parsedPrice;
        }
    });
    couponOption.addEventListener('change', function () {
        const couponOptionValue = couponOption.value;
        const discountValueElement = document.getElementById('discount_value');
        discountValueElement.textContent = couponOptionValue + "%";
    });

    // Display the total sum
    const totalSumElement = document.getElementById('total_price_sum');
    totalSumElement.innerText = totalPriceSum.toFixed(1) + 'VND';

    // Parse the discount value
    const couponOptionValue = couponOption.value;
    const discountValueElement = document.getElementById('discount_value');
    discountValueElement.textContent = couponOptionValue + "%";
    const discountValueText = discountValueElement.innerText;
    const discountValue = parseFloat(discountValueText.substring(0, discountValueText.length - 1));

    // Calculate the final total
    const finalTotal = totalPriceSum - (totalPriceSum * discountValue / 100);
    const finalTotalElement = document.getElementById('total_price_final');
    finalTotalElement.innerText = finalTotal.toFixed(1) + 'VND';

    const tps_textCont = document.getElementById("total_price_sum").textContent;
    const tps_textCont_float = parseFloat(tps_textCont.substring(0, tps_textCont.length - 3));
    document.getElementById("tps_value_input").value = tps_textCont_float;

    const dvi_textCont = document.getElementById("discount_value").textContent;
    const dvi_textCont_float = parseFloat(dvi_textCont.substring(0, dvi_textCont.length - 1));
    document.getElementById("dis_value_input").value = dvi_textCont_float;

    const tpf_textCont = document.getElementById("total_price_final").textContent;
    const tpf_textCont_float = parseFloat(tpf_textCont.substring(0, tpf_textCont.length - 3));
    document.getElementById("tpf_value_input").value = tpf_textCont_float;
});

document.addEventListener('DOMContentLoaded', function () {
    const couponOption = document.querySelector('.coupon');
    const discountValueElement = document.getElementById('discount_value');
    const applyCouponButton = document.getElementById('btnCouponApply');

    applyCouponButton.addEventListener('click', function () {
        const selectedOption = couponOption.options[couponOption.selectedIndex];
        const discountPercentage = selectedOption.value;
        discountValueElement.textContent = discountPercentage + "%";
        updateFinalTotal();
    });

    function updateFinalTotal() {
        const totalSumElement = document.getElementById('total_price_sum');
        const totalPriceSum = parseFloat(totalSumElement.innerText.replace('VND', ''));

        const couponOptionValue = parseFloat(discountValueElement.textContent);
        const finalTotal = totalPriceSum - (totalPriceSum * couponOptionValue / 100);

        const finalTotalElement = document.getElementById('total_price_final');
        finalTotalElement.innerText = finalTotal.toFixed(1) + 'VND';

        const tps_textCont = document.getElementById("total_price_sum").textContent;
        const tps_textCont_float = parseFloat(tps_textCont.substring(0, tps_textCont.length - 3));
        document.getElementById("tps_value_input").value = tps_textCont_float;

        const dvi_textCont = document.getElementById("discount_value").textContent;
        const dvi_textCont_float = parseFloat(dvi_textCont.substring(0, dvi_textCont.length - 1));
        document.getElementById("dis_value_input").value = dvi_textCont_float;

        const tpf_textCont = document.getElementById("total_price_final").textContent;
        const tpf_textCont_float = parseFloat(tpf_textCont.substring(0, tpf_textCont.length - 3));
        document.getElementById("tpf_value_input").value = tpf_textCont_float;
    }
});

//document.addEventListener('DOMContentLoaded', function () {
//    function confirmDeleteForm(productId) {
//        // Creating form element
//        var form = document.createElement('form');
//        form.setAttribute('id', 'deleteProductForm');
//        form.setAttribute('method', 'post');
//        form.setAttribute('action', 'Checkout?action=deleteProduct'); // Set proper action
//
//        // Creating hidden input for product ID
//        var hiddenInput = document.createElement('input');
//        hiddenInput.setAttribute('type', 'hidden');
//        hiddenInput.setAttribute('name', 'p_id');
//        hiddenInput.setAttribute('value', productId);
//
//        // Appending the hidden input to the form
//        form.appendChild(hiddenInput);
//
//        // Creating the confirmation button
//        var confirmButton = document.createElement('button');
//        confirmButton.setAttribute('type', 'button');
//        confirmButton.setAttribute('class', 'btn-yes btn btn-light btn-block');
//        confirmButton.innerText = 'Confirm';
//
//        // Appending the confirmation button to the form
//        form.appendChild(confirmButton);
//
//        // Creating a container div to hold the form
//        var formContainer = document.createElement('div');
//        formContainer.appendChild(form);
//
//        toastr.options = {
//            "preventDuplicates": true,
//            "showDuration": "300",
//            "hideDuration": "1000",
//            "timeOut": "0",
//            "extendedTimeOut": "0",
//            "showEasing": "swing",
//            "hideEasing": "linear",
//            "showMethod": "fadeIn",
//            "hideMethod": "fadeOut"
//        };
//
//        toastr.warning('<span>Close after: </span><span class="countdown-circle">10s</span>\n\
//                        <div>\n\
//                        Are you sure you want to remove this product?\n\
//                        </div>'
//                , formContainer.innerHTML, {
//                    "closeButton": true,
//                    "positionClass": "toast-top-center",
//                    "progressBar": false,
//                    "onclick": function () {
//                        clearInterval(intervalId);
//                        toastr.clear();
//                    }
//                });
//
//        var countdown = 10;
//        var intervalId = setInterval(function () {
//            if (countdown <= 0) {
//                clearInterval(intervalId);
//                toastr.clear();
//            } else {
//                countdown--;
//                document.querySelector('.countdown-circle').innerText = countdown + 's';
//            }
//        }, 1000);
//
//        var confirmationButton = document.querySelector('.btn-yes');
//        if (confirmationButton) {
//            confirmationButton.addEventListener('click', function () {
//                var form = document.getElementById('deleteProductForm');
//                if (form) {
//                    form.submit(); // Submit the form
//                    clearInterval(intervalId);
//                    toastr.clear(); // Clear toastr after form submission
//                } else {
//                    console.error('Form not found');
//                }
//            });
//        } else {
//            console.error('Confirmation button not found');
//        }
//
//        setTimeout(function () {
//            clearInterval(intervalId);
//            toastr.clear();
//        }, 10000);
//    }
//
//    var sampleProductId = 'sampleProductId';
//    confirmDeleteForm(sampleProductId);
//});
//
//






