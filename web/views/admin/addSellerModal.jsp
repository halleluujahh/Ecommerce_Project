<%-- 
    Document   : addSellerModal
    Created on : Mar 19, 2024, 11:28:58 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addSellerModal" tabindex="-1" role="dialog" aria-labelledby="addSellerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add Seller Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addSellerForm" action="dashboard?action=add-seller" method="POST">
                    <div class="form-group">
                        <label for="pname">Email: </label>
                        <input type="email" class="form-control" id="emailInput" name="email">
                        <div style="color: red" id="emailError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="productDescription">Password: </label>
                        <input type="password" class="form-control" id="passwordInput" name="password">
                        <div style="color: red" id="passwordError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="productDescription">Re-password: </label>
                        <input type="password" class="form-control" id="password1Input" name="password1">
                        <div style="color: red" id="password1Error" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="genderSelect">Gender: </label>
                        <select class="form-control" id="genderSelect" name="gender" required>
                            <option value="">Select gender</option>
                            <c:forEach items="${listGenders}" var="g">
                                <option value="${g.id}">${g.gender}</option>
                            </c:forEach>
                        </select>
                        <div style="color: red" id="genderError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addSellerForm" onclick="validateAddSellerForm(event)">Add</button>
            </div>
        </div>
    </div>
</div>

<script>

    var erroras = "${erroras}";
    if (erroras) {
        alert("Error: " + erroras);
    }

    var msgas = "${msgas}";
    if (msgas) {
        alert("Success: " + msgas);
    }

    function validateAddSellerForm(event) {
        event.preventDefault();

        let email = $('#emailInput').val();
        let password = $('#passwordInput').val();
        let password1 = $('#password1Input').val();
        let gender = $('#genderSelect').val();

        $('.error').html('');

        if (gender === '') {
            $('#genderError').html('Please choose gender!');
        }

        if (email === '') {
            $('#emailError').html('Email cannot be blank');
        } else if (email.length < 5) {
            $('#emailError').html('Email must be at least 5 characters long.');
        } else if (/\s/.test(email)) {
            $('#emailError').html('Spaces are not allowed in the email.');
        } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            $('#emailError').html('Invalid email format');
        }

        if (password === '') {
            $('#passwordError').html('Password cannot be blank');
        } else if (password.length < 5) {
            $('#passwordError').html('Password must be at least 5 characters long.');
        } else if (!/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$/.test(password)) {
            $('#passwordError').html('Password must contain at least 8 characters (1 number, 1 uppercase char, 1 special char)');
        }



        if (password1 === '') {
            $('#password1Error').html('Re-password cannot be blank');
        } else if (password1 !== password) {
            $('#password1Error').html('Re-entered password must match the password');
        }

        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });

        if (error === '') {
            if (confirm('Are you sure you want to add a new seller?')) {
                $('#addSellerForm').submit();
            }
        }
    }




</script>
