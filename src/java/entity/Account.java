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
 * @author admin
 */
@Data
@Builder
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Account {
    private int id;
    private String email;
    private String password;
    private String verifyCode;
    private Date created_on;
    private int role_Id;
    private String role;
    private String status;
    private Date status_date;

    private Account_Detail acc_det;
}
