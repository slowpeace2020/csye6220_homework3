package edu.neu.csye6220.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/view_cart.do")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println("CartController doGet method");
        ObjectMapper objectMapper = new ObjectMapper();
        Object data = session.getAttribute("data");
        Map<String, List<String>> mapper = new HashMap<String, List<String>>();
        if(data!=null){
            mapper = objectMapper.readValue(String.valueOf(data), new TypeReference<Map<String,  List<String>>>(){});
            List<String> all = new ArrayList<>();
            for(String key:mapper.keySet()){
                all.addAll(mapper.get(key));
            }
            req.setAttribute("list",all);
        }

        req.getRequestDispatcher("/view_cart.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("CartController doPost method");
        HttpSession session = req.getSession();
        ObjectMapper objectMapper = new ObjectMapper();
        Object data = session.getAttribute("data");
        String item = req.getParameter("item");
        Map<String, List<String>> mapper = new HashMap<String, List<String>>();
        if(data!=null){
            mapper = objectMapper.readValue(String.valueOf(data), new TypeReference<Map<String,  List<String>>>(){});
            List<String> all = new ArrayList<>();
            for(String key:mapper.keySet()){
                mapper.get(key).remove(item);
                all.addAll(mapper.get(key));
            }
            req.setAttribute("list",all);
        }
        String json = objectMapper.writeValueAsString(mapper);
        session.setAttribute("data",json);
        req.getRequestDispatcher("/view_cart.jsp").forward(req,resp);
    }
}
