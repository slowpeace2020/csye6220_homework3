package edu.neu.csye6220.controller;

import edu.neu.csye6220.utils.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * MVC application and use PreparedStatement to enter the books to the databas
 */

@WebServlet("/books.do")
public class BookController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Integer num = Integer.valueOf(req.getParameter("num"));
            req.setAttribute("num",num);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("part7/book_add.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] isbns = req.getParameterValues("isbn[]");
        String[] titles = req.getParameterValues("title[]");
        String[] authors = req.getParameterValues("authors[]");
        String[] prices = req.getParameterValues("price[]");
        int len =isbns.length;
        req.setAttribute("num",len);
        JDBCUtil jdbcUtil = new JDBCUtil();
        jdbcUtil.getConn();
        for(int i=0;i<len;i++){
            String sql = "insert into books (isbn,title,authors,price) values (\""
                    +isbns[i]+"\",\""+titles[i]+"\",\""+authors[i]+"\",\""+prices[i]+"\")";
            jdbcUtil.insert(sql);
        }
        jdbcUtil.closConn();
        req.getRequestDispatcher("part7/book_add_success.jsp").forward(req,resp);
    }
}
