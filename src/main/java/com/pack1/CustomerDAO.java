package com.pack1;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDAO {

    public boolean register(CustomerBean c) {
        String sql = "INSERT INTO customer VALUES(?,?,?,?,?,?,?)";
        try (Connection conn = DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getUsername());
            ps.setString(2, c.getPassword());
            ps.setString(3, c.getFirstname());
            ps.setString(4, c.getLastname());
            ps.setString(5, c.getAddress());
            ps.setString(6, c.getEmail());
            ps.setString(7, c.getMobile());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }

    public CustomerBean login(String username, String password) {
        CustomerBean customer = null;
        Connection con ;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnect.connect(); // get a fresh connection
            ps = con.prepareStatement(
                "SELECT * FROM customer WHERE uname=? AND CUST_PASSWORD=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if(rs.next()) {
                customer = new CustomerBean();
                customer.setUsername(rs.getString("uname"));
                customer.setPassword(rs.getString("CUST_PASSWORD"));

                // set other fields
            }

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            // close ResultSet, PreparedStatement, but keep Connection alive if using connection pool
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            // Do NOT close connection if using a shared pool; otherwise close it
            // try { if(con != null) con.close(); } catch(Exception e) {}
        }
        return customer;
    }

}
