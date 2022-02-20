package edu.neu.csye6220.controller;

import edu.neu.csye6220.domain.Movie;
import edu.neu.csye6220.utils.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * MVC application to browse movies and add new movies
 */


@WebServlet("/movie_navigate.do")
public class MovieController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url =req.getContextPath()+req.getParameter("page_name");
        resp.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if(action.equals("add")){
            String title = req.getParameter("title");
            String actress = req.getParameter("actress");
            String actor = req.getParameter("actor");
            String genre = req.getParameter("genre");
            String year = req.getParameter("year");
            String sql = "insert into movies (title,actress,actor,genre,year) values (\""
                    +title+"\",\""+actress+"\",\""+actor+"\",\""+genre+"\",\""+year+"\")";
            JDBCUtil jdbcUtil = new JDBCUtil();
            jdbcUtil.getConn();
            jdbcUtil.insert(sql);
            jdbcUtil.closConn();

            req.getRequestDispatcher("movie_add_success.jsp").forward(req,resp);
        }else if(action.equals("search")){
            String name = req.getParameter("keyword");
            String valueType = req.getParameter("search_type");
            try {
                List<Movie> list = findListByQuery(valueType,name);
                System.out.println(list);
                System.out.println(name);
                req.setAttribute("list",list);
                req.setAttribute("keyword",name);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        req.getRequestDispatcher("movie_list.jsp").forward(req,resp);
    }


    private List<Movie> findListByQuery(String column,String value) throws SQLException {
        String sql = "select * from movies where "+column+" like \"%"+value+"%\"";
        System.out.println(sql);
        JDBCUtil jdbcUtil = new JDBCUtil();
        jdbcUtil.getConn();
        ResultSet resultSet = jdbcUtil.query(sql);
        List<Movie> movies = new ArrayList<>();
        while (resultSet.next()){
            Movie movie = new Movie();
            movie.setTitle(resultSet.getString("title"));
            movie.setActress(resultSet.getString("actress"));
            movie.setActor(resultSet.getString("actor"));
            movie.setGenre(resultSet.getString("genre"));
            movie.setYear(resultSet.getString("year"));
            movies.add(movie);
        }
        resultSet.close();
        return movies;
    }
}
