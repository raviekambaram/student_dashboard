package com.sn.pkg;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {

	 private static DBCon instance = new DBCon();
    public static final String url = "jdbc:mysql://localhost:3306/withub?autoReconnect=true&useSSL=false";
    public static final String username = "root";
    public static final String password = "root";
    public static final String driver = "com.mysql.jdbc.Driver"; 
	
		
		private DBCon() 
		{
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
		
	
		private Connection createConnection() throws Exception{
			try{
			//Class.forName(driver);
			Connection conn = DriverManager.getConnection(url,username,password);
			System.out.println("Connected");
			return conn;
			}
			catch(Exception e){System.out.println(e);} return null;
			}
		public static Connection getConnection() {
        try {
			return instance.createConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
    }	
	}


