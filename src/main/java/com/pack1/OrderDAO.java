package com.pack1;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class OrderDAO {

    // insert order and return generated order id or -1 on fail
    public boolean createOrder(String reqNo, int custId, String pcode, int qty, double amount) {
        String sql = "INSERT INTO orders(req_no,cust_id,pcode,pqty,pprice) VALUES(?,?,?,?,?)";
        try (Connection conn =  DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, reqNo);
            ps.setInt(2, custId);
            ps.setString(3, pcode);
            ps.setInt(4, qty);
            ps.setDouble(5, amount);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
