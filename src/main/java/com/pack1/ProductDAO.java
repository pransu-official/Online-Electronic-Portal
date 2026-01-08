package com.pack1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class ProductDAO {

    public List<Map<String,Object>> getAllProducts() {
        String sql = "SELECT pcode, pname, pcompany, PPRICE, PQTY FROM product";
        List<Map<String,Object>> list = new ArrayList<>();
        try (Connection conn =  DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String,Object> row = new HashMap<>();
                row.put("pcode", rs.getString("pcode"));
                row.put("pname", rs.getString("pname"));
                row.put("pcompany", rs.getString("pcompany"));
                row.put("price", rs.getDouble("pprice"));
                row.put("qty", rs.getInt("pqty"));
                list.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Map<String,Object> getProduct(String pcode) {
        String sql = "SELECT pcode, pname, pcompany, pprice, pqty FROM product WHERE pcode=?";
        try (Connection conn =  DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, pcode);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Map<String,Object> row = new HashMap<>();
                row.put("pcode", rs.getString("pcode"));
                row.put("pname", rs.getString("pname"));
                row.put("pcompany", rs.getString("pcompany"));
                row.put("price", rs.getDouble("pprice"));
                row.put("qty", rs.getInt("pqty"));
                return row;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateQty(String pcode, int reduceBy) {
        String sql = "UPDATE product SET pqty = pqty - ? WHERE pcode = ? AND pqty >= ?";
        try (Connection conn =  DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reduceBy);
            ps.setString(2, pcode);
            ps.setInt(3, reduceBy);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

