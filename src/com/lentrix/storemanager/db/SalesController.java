/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lentrix.storemanager.db;

import com.lentrix.storemanager.Helper;
import com.lentrix.storemanager.models.SalesModel;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.sql.ResultSet;
import java.time.LocalDateTime;

/**
 *
 * @author lentrix
 */
public class SalesController {
    public static SalesModel create() throws SQLException {
        Connection conn = DB.connect();
        
        PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO sales (`timestamp`, `user_id`) "
                        + "VALUES (?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
        
        ps.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
        ps.setInt(2, Helper.currentUser.getId());
        ps.executeUpdate();
        int key = ps.getGeneratedKeys().getInt(0);
        
        SalesModel sales = SalesController.get(key);
        
        return sales;
    }
    
    public static SalesModel get(int id) throws SQLException {
        Connection conn = DB.connect();
        ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM sales WHERE id=" + id);
        if(rs.next()) {
            return new SalesModel(
                    rs.getInt("id"),
                    rs.getTimestamp("timestamp").toLocalDateTime(),
                    UserController.get(rs.getInt("user_id"))
            );
        }else {
            return null;
        }
    }
}
