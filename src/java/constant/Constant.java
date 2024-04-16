/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constant;

import java.text.DecimalFormat;

/**
 *
 * @author LENOVO
 */
public class Constant {

    public static final int RECORD_PER_PAGE = 10;

    public static final String SESSION_ACCOUNT = "account";

    public static final String EMAIL_REGEX = "^[0-9A-Za-z_+$*-]+(?:\\." + "[0-9A-Za-z_+$*-]+)*@" + "(?:[0-9A-Za-z-]+\\.)+[a-zA-Z]{2,7}$";
    public static final String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";

    public static final int ROLE_CUSTOMER = 1;
    public static final int ROLE_ADMIN = 2;
    public static final int ROLE_SELLER = 3;

    public static String GOOGLE_CLIENT_ID = "372299396112-kir35j0nmvs9pq4g5e8h26k1rv9j23bd.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:9999/SWP391_SE1754_G1/login-google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    
    public static final String FORMAT_NUMBER(double number) {
        return String.format("%.2f", number);
    }
}
