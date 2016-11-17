package org;

/**
 * Created by dell on 2016/9/16.
 */

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConn {
    private static Connection conn;

    public static Connection getConn() {
        return conn;
    }

    public static Connection getConnection() throws
            SQLException,NamingException{
        try {
            String url = String.format("jdbc:mysql://localhost:3306/User");
            String username = "root";
            String password = "wjsw5945@";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, username, password);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    public static void main (String[] args){
        DatabaseConn dbc = new DatabaseConn();
        try{
            dbc.getConnection();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
