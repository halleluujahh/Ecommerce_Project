<%-- 
    Document   : editCategoryModal
    Created on : Jan 27, 2024, 10:09:40 PM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCategoryModalLabel">Edit Profile Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateProfile" action="../seller/dashboard?action=update-profile" method="POST">
                    <input style="display: none" type="text" class="form-control" id="${af.id}" name="accountIdToUpdate">
                    <div class="form-group">
                        <label>Username:</label>
                        <input id="usernameInput" type="text" class="form-control" value="${af.username}" name="username">
                        <div id="usernameError1" class="error"></div>
                        <div style="color:red" class="error" id="usernameError"></div>
                    </div>
                    <div class="form-group">
                        <label>Phone number:</label>
                        <input id="phonenumberInput" type="tel" class="form-control" value="${af.phone_number}" name="phone_number">
                        <div id="phonenumberError1" class="error"></div>
                        <div style="color:red" class="error" id="phoneNumberError"></div>
                    </div>
                    <div class="form-group">
                        <label>Date of birth:</label>
                        <input id="dobInput" type="date" class="form-control" value="${af.dob}" name="dob">
                        <div style="color:red" id="dobError1" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label>Gender:</label>
                        <select class="form-control" id="genderSelect1" name="gender" required>
                            <c:forEach items="${listG}" var="g">
                                <option <c:if test="${af.gender_id eq g.id}">selected=""</c:if> value="${g.id}">${g.gender}</option>
                            </c:forEach>
                        </select>
                        <div style="color:red" id="genderError1" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label>Address:</label>
                        <input id="addressInput" type="text" class="form-control" value="${af.address}" name="address">
                        <div style="color:red" id="addressError1" class="error"></div>
                    </div>
                </form> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="updateProfile" onclick="validateProfileForm2(event)">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>

    var msg = "${msgup}";
    if (msg) {
        alert("Success: " + msg);
    }

    var error = "${errorup}";
    if (error) {
        alert("Error: " + error);
    }

    function validateProfileForm2(event) {
        event.preventDefault(); // Prevent the default form submission behavior

        let username = $('#usernameInput').val();
        let phonenumberInput = $('#phonenumberInput').val();
        let dobInput = $('#dobInput').val();
        let genderSelect1 = $('#genderSelect1').val();
        let addressInput = $('#addressInput').val();

        // Clear current error messages
        $('.error').html('');

        if (genderSelect1 === '') {
            $('#genderError1').html('Please choose gender!');
        }

        if (dobInput === '') {
            $('#dobError1').html('Please choose date of birth!');
        } else {
            var dobDate = new Date(dobInput);
            var currentDate = new Date();

            var hundredYearsAgo = new Date();
            hundredYearsAgo.setFullYear(currentDate.getFullYear() - 100);

            var eighteenYearsAgo = new Date();
            eighteenYearsAgo.setFullYear(currentDate.getFullYear() - 18);

            if (dobDate > hundredYearsAgo && dobDate < eighteenYearsAgo) {
                $('#dobError1').html('');
            } else {
                $('#dobError1').html('Please choose a valid date of birth!');
            }
        }

        if (addressInput === '') {
            $('#addressError1').html('Address cannot be blank');
        } else if (addressInput.length < 6) {
            $('#addressError1').html('Address must be at least 6 characters long.');
        } else if (!/^(?!.*\s{2})[A-Za-z0-9\s,]+$/.test(addressInput)) {
            $('#addressError1').html('Address must contain only letters, numbers and \',\'.');
        }


        if (username === '') {
            $('#usernameError').html('Username cannot be blank');
        } else if (username.length < 5) {
            $('#usernameError').html('Username must be at least 5 characters long.');
        } else if (!/^(?!.*\s{2})[A-Za-z0-9\s]+$/.test(username)) {
            $('#usernameError').html('Username must contain only letters and numbers');
        }

        if (phonenumberInput === '') {
            $('#phoneNumberError').html('Phone number cannot be blank');
        } else if (!/^\d{10}$/.test(phonenumberInput)) {
            $('#phoneNumberError').html('Phone number must contain exactly 10 digits');
        } else if (phonenumberInput.charAt(0) !== '0') {
            $('#phoneNumberError').html('Phone number must start with 0');
        }

        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });

        if (error === '') {
            if (confirm('Are you sure you want to update profile?')) {
                $('#updateProfile').submit();
            }
        }
    }


</script>

