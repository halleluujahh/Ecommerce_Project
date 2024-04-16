/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
@Builder
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class AccountDetailUM {
    private int account_id;
    private String phone_number;
    private boolean gender;
    // Cho nay de string de insert thang xuong db luon khong can de la date type
    private String dob;
    private String member_code;
    private String address;
    private String userName;
    private String email;
}