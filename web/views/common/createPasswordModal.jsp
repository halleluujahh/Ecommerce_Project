<%-- 
    Document   : changePasswordModal
    Created on : Mar 12, 2024, 8:29:12 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="createPasswordModal" tabindex="-1" role="dialog" aria-labelledby="createPasswordModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createPasswordModal">Create Password Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="createPasswordForm" action="home?action=createPassword" method="POST">
                    <div class="reg_form">
                        <h5 class="form_title text-uppercase text-center">Create Password</h5>
                        <br>
                        <div class="form_item">
                            <input  type="hidden" name="email" value="${sessionScope.account.email}">
                        </div>
                        <div class="form_item">
                            <input type="" id="password8" name="newPassword"
                                   placeholder="New Password">
                            <div class="error" id="newPassword1Error" style="color: red"></div>
                        </div>
                        <div class="form_item">
                            <input type="" id="password9" name="newPassword2"
                                   placeholder="Confirm New Password">
                            <div class="error" id="newPassword3Error" style="color: red"></div>
                        </div>
                        <button onclick="validateCreatePassword()" type="submit"
                                class="custom_btn bg_default_red text-uppercase mb_50"
                                style=margin-left: 30px>Create Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    function validateCreatePassword() {
        let newPassword = $('#password8').val();
        let newPassword2 = $('#password9').val();

        $('.error').html('');

        if (newPassword === '') {
            $('#newPassword1Error').html('New password cannot be blank');
        } else if (newPassword.length < 8) {
            $('#newPassword1Error').html('New password must be at least 8 characters long.');
        } else if (!/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$/.test(newPassword)) {
            $('#newPassword1Error').html('New password must contain at least 8 characters (1 number, 1 uppercase char, 1 special char)');
        }

        if (newPassword2 === '') {
            $('#newPassword3Error').html('Confirm password cannot be blank');
        }

        if (newPassword !== newPassword2) {
            $('#newPassword1Error').html('New password and confirm password must be equal');
            $('#newPassword3Error').html('New password and confirm password must be equal');
        }

        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            if (confirm('Are you sure you want to create your new password?')) {
                $('#createPasswordForm').submit();
            } else {
                event.preventDefault();
            }
        } else {
            event.preventDefault();
        }
    }
</script>

