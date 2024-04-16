<%-- 
    Document   : changePasswordModal
    Created on : Mar 12, 2024, 8:29:12 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changePasswordModal">Change Password Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updatePasswordForm" action="home?action=changePassword" method="POST">
                    <div class="reg_form">
                        <h5 class="form_title text-uppercase text-center">Change Pass</h5>
                        <br>
                        <div class="form_item">
                            <input  type="hidden" name="email" value="${sessionScope.account.email}">
                        </div>
                        <div class="form_item">
                            <input type="password" id="password5" name="password"
                                   placeholder="Old Password">
                            <div class="error" id="passwordError" style="color: red"></div>
                        </div>
                        <div class="form_item">
                            <input type="password" id="password6" name="newPassword"
                                   placeholder="New Password">
                            <div class="error" id="newPasswordError" style="color: red"></div>
                        </div>
                        <div class="form_item">
                            <input type="password" id="password7" name="newPassword2"
                                   placeholder="Confirm New Password">
                            <div class="error" id="newPassword2Error" style="color: red"></div>
                        </div>
                        <button onclick="validateChangePassword()" type="submit"
                                class="custom_btn bg_default_red text-uppercase mb_50"
                                style=margin-left: 30px>Change Pass</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    function validateChangePassword() {
        let password = $('#password5').val();
        let newPassword = $('#password6').val();
        let newPassword2 = $('#password7').val();
        let sessionPassword = "${sessionScope.account.password}";

        $('.error').html('');

        if (password === '') {
            $('#passwordError').html('Password cannot be blank');
        } else if (sessionPassword !== password) {
            $('#passwordError').html('Incorrect password!');
        }

        if (newPassword === '') {
            $('#newPasswordError').html('New password cannot be blank');
        } else if (newPassword.length < 8) {
            $('#newPasswordError').html('New password must be at least 8 characters long.');
        } else if (!/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$/.test(newPassword)) {
            $('#newPasswordError').html('New password must contain at least 8 characters (1 number, 1 uppercase char, 1 special char)');
        }

        if (newPassword2 === '') {
            $('#newPassword2Error').html('Confirm password cannot be blank');
        }

        if (newPassword === password) {
            $('#newPasswordError').html('Old password and new password must be different');
            $('#passwordError').html('Old password and new password must be different');
        }

        if (newPassword !== newPassword2) {
            $('#newPasswordError').html('New password and confirm password must be equal');
            $('#newPassword2Error').html('New password and confirm password must be equal');
        }

        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to update your password?')) {
                $('#updatePasswordForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }
</script>

