/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import Despacho.*;
import Clases.*;
import Clases.*;
import java.security.SecureRandom;

/**
 *
 * @author chris
 */
public class Pass {
    public static String generateRandomPassword(int len)
    {
        // ASCII range - alphanumeric (0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
 
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
 
        // each iteration of loop choose a character randomly from the given ASCII range
        // and append it to StringBuilder instance
 
        for (int i = 0; i < len; i++) {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        return sb.toString();
    }
 
    public static void main(String[] args) {
        int len = 10;
        System.out.println(generateRandomPassword(len));
    }
}
