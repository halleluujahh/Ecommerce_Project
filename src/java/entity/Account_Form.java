/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;
import lombok.Builder;
import lombok.Data;

/**
 *
 * @author LENOVO
 */
@Data
@Builder
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Account_Form {
    private int id;
    private String email;
    private String password;
    private String member_code;
    private String phone_number;
    private int gender_id;
    private Date created_on;
    private String gender;
    private Date dob;
    private String address;
    private String username;
    private int role_Id;
    private String role;
    private int status;
    private Date status_date;
}
