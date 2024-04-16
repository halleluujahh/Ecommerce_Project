/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

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

public class Size {
    private int id;
    private String size;
    private int status;
}