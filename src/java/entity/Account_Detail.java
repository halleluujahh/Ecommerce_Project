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
public class Account_Detail {
    private int id;
    private int account_id;
    private String phone_number;
    private boolean gender;
    private Date dob;
    private String member_code;
    private String address;
    private String username;
    private int status;
    private Date status_date;
}
