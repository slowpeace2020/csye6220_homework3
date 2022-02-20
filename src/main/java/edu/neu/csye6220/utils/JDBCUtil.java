package edu.neu.csye6220.utils;

import edu.neu.csye6220.domain.Movie;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JDBCUtil {
    private Connection conn = null;
    ResultSet resultSet = null;
    PreparedStatement statement = null;
    public void getConn(){
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
        String root = "root";
        String password= "123456test!";
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url,root,password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet query(String sql){
        try {
            statement = conn.prepareStatement(sql);
            resultSet = statement.executeQuery(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultSet;
    }

    public boolean insert(String sql){
        try {
            statement = conn.prepareStatement(sql);
           boolean in = statement.execute(sql);
           return in;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    public void closConn(){
        try {
            statement.close();
            conn.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        String column = "title";
        String value = "3";

        String sql = "select * from movies where "+column+" like \"%"+value+"%\"";
        System.out.println(sql);
        JDBCUtil jdbcUtil = new JDBCUtil();
        jdbcUtil.getConn();
        ResultSet resultSet = jdbcUtil.query(sql);
        List<Movie> movies = new ArrayList<>();
        while (true){
            try {
                if (!resultSet.next()) break;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            Movie movie = new Movie();
            movie.setTitle(resultSet.getString("title"));
            movie.setActress(resultSet.getString("actress"));
            movie.setActor(resultSet.getString("actor"));
            movie.setGenre(resultSet.getString("genre"));
            movie.setYear(resultSet.getString("year"));
        }

    }

}
