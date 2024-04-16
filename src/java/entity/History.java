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
public class History {
    private int id;
    private int account_id;
    private Date update_date;
    private String username;
    private String email;
    private String phone_number;
}
