package com.pack1;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect implements DBInfo {

    public static Connection connect() {
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection(DBInfo.DBurl, DBInfo.DBUname, DBInfo.DBpwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
