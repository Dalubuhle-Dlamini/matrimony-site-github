package com.matrimony.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 *
 * @author dsihle875@gmail.com
 */
public class DBConnection{
    // connection variables and constants
    private static String dbName = "matrinomydb";
    private static String username = "root";
    private static String password = "";
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/" + dbName;
    private static final String JDBC_USERNAME = username;
    private static final String JDBC_PASSWORD = password;

    static{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    public static void closeConnection(Connection c){
        if(c != null){
            try {
                c.close();
            } catch (SQLException e) {
                throw new ExceptionInInitializerError(e);
            }
        }
    }

}