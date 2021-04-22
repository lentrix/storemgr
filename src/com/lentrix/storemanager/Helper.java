/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lentrix.storemanager;

import com.lentrix.storemanager.models.UserModel;
import java.awt.Component;
import javax.swing.JOptionPane;

/**
 *
 * @author lentrix
 */
public class Helper {
    protected static UserModel currentUser;
    
    public static void error(String message, Component parent) {
        JOptionPane.showMessageDialog(parent, message, "Error!", JOptionPane.ERROR_MESSAGE);
    }
    
    public static void info(String message, Component parent) {
        JOptionPane.showMessageDialog(parent, message, "Error!", JOptionPane.INFORMATION_MESSAGE);
    }
    
}
