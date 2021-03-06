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
import java.util.*;

/**
 * using a  session object to  store and retrieve selected items  from a simple shopping cart application. Shopping
 * cart applications typically allow users to select items from a catalog and place them in a virtual shopping car
 *
 */
@WebServlet("/part8.do")
public class StoreController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println("there");
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

        req.getRequestDispatcher("/part8/store.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        ObjectMapper objectMapper = new ObjectMapper();
        Object data = session.getAttribute("data");
        Map<String, List<String>> mapper = new HashMap<String, List<String>>();
        List<String> all = new ArrayList<>();
        if(action.equals("add")){
            String category = req.getParameter("category");
            System.out.println(category);
            String[] values = req.getParameterValues(category+"[]");

            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html;charset=UTF-8");

            List<String> list = Arrays.asList(values);
            if(data!=null){
                mapper = objectMapper.readValue(String.valueOf(data), new TypeReference<Map<String,  List<String>>>(){});
            }
            mapper.put(category,list);
            for(String key:mapper.keySet()){
                all.addAll(mapper.get(key));
            }
        }else if(action.equals("delete")){
            String item = req.getParameter("item");
            if(data!=null){
                mapper = objectMapper.readValue(String.valueOf(data), new TypeReference<Map<String,  List<String>>>(){});
                for(String key:mapper.keySet()){
                    mapper.get(key).remove(item);
                    all.addAll(mapper.get(key));
                }
            }
        }

        req.setAttribute("list",all);
        String json = objectMapper.writeValueAsString(mapper);
        session.setAttribute("data",json);

//        req.getRequestDispatcher("/store.jsp").forward(req,resp);
        resp.sendRedirect(req.getContextPath()+"/part8.do");
    }
}
