<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">  <%-- 在IE运行最新的渲染模式 --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">  <%-- 初始化移动浏览显示 --%>
    <meta name="Author" content="Dreamer-1.">
    <!-- 引入各种CSS样式表 -->
    <link rel="stylesheet" href="css/bootstrap.css">

    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/index.css">  <!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
    <link rel="stylesheet" href="css/font-change.css">  <!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->
    <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>- Shopping Center -</title>
</head>
<body>
<!-- top menu）==================================== -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/part8.do" ><i class="fa fa-users"></i> ViewCart</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- left menu========================================= -->
<div class="container-fluid">
    <div class="row-fluie">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <!-- 一级菜单 -->
                <li class="active">
                    <a href="#userMeun" onclick="showAtRight('part8/book_list.jsp')" class="nav-header menu-first collapsed" data-toggle="collapse">
                    <i class="fa fa-user"></i>  Books <span class="sr-only"></span></a>
                </li>
                <li class="active">
                    <a href="#userMeun" onclick="showAtRight('part8/book_list.jsp')" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-user"></i>  Books <span class="sr-only"></span></a>
                </li>
                <li>
                    <a href="#userMeun" onclick="showAtRight('part8/movies.jsp')" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-user"></i>  Movies <span class="sr-only"></span></a>
                </li>
                <li>
                    <a href="#userMeun" onclick="showAtRight('part8/computers.jsp')" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-user"></i>  Computers <span class="sr-only"></span></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 右侧内容展示==================================================  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div id="content">
        <c:if test="${list.size()>0}">
            <h4>The following item has been added to your shopping cart successfully</h4>
            <form action="${pageContext.request.contextPath}/part8.do" method="post">
                <input type="hidden" name="action" value="delete">
                <div style="margin-bottom: 20px">
                    <c:forEach items="${list}" var="keyword" varStatus="id">
                        - &nbsp; ${keyword}<input type="hidden" name="item" value="${keyword}"/>&nbsp;&nbsp;&nbsp;<input type="submit" value="Delete"><br>
                    </c:forEach>
                </div>
            </form>
            <div>
                <a href="${pageContext.request.contextPath}/part8.do">View Cart</a>&nbsp;&nbsp;
                <a href="#userMeun" onclick="showAtRight('part8/book_list.jsp')">Books</a>&nbsp;&nbsp;
                <a href="#userMeun" onclick="showAtRight('part8/movies.jsp')">Movie</a>&nbsp;&nbsp;
                <a href="#userMeun" onclick="showAtRight('part8/computers.jsp')">Computer</a>
            </div>
        </c:if>
        <c:if test="${list==null || list.size()<1}">
            <div class="panel panel-default">
                <h4>Oops, your cart is empty ~~ </h4>
            </div>
        </c:if>
    </div>
</div>
<script type="text/javascript">
    /*
     * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
     * （实现左侧菜单中的标签点击后变色的效果）
     */
    $(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            //e.preventDefault();  加上这句则导航的<a>标签会失效
            $('ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });
    /*
     * 解决ajax返回的页面中含有javascript的办法：
     * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
     */
    function executeScript(html)
    {
        var reg = /<script[^>]*>([^\x00]+)$/i;
        //对整段HTML片段按<\/script>拆分
        var htmlBlock = html.split("<\/script>");
        for (var i in htmlBlock)
        {
            var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
            if (blocks = htmlBlock[i].match(reg))
            {
                //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                var code = blocks[1].replace(/<!--/, '');
                try
                {
                    eval(code) //执行脚本
                }
                catch (e)
                {
                }
            }
        }
    }
    /*
     * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
     * 注意：
     *  ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
     *  ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
     *  （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
    */
    function showAtRight(url) {
        var xmlHttp;
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlHttp=new XMLHttpRequest();  //创建 XMLHttpRequest对象
        }
        else {
            // code for IE6, IE5
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.onreadystatechange=function() {
            //onreadystatechange — 当readystate变化时调用后面的方法
            if (xmlHttp.readyState == 4) {
                //xmlHttp.readyState == 4  ——  finished downloading response
                if (xmlHttp.status == 200) {
                    //xmlHttp.status == 200    ——  服务器反馈正常
                    document.getElementById("content").innerHTML=xmlHttp.responseText;  //重设页面中id="content"的div里的内容
                    executeScript(xmlHttp.responseText);  //执行从服务器返回的页面内容里包含的JavaScript函数
                }
                //错误状态处理
                else if (xmlHttp.status == 404){
                    alert("Ooops☹  （Code Error：404 Not Found），……！");
                    /* 对404的处理 */
                    return;
                }
                else if (xmlHttp.status == 403) {
                    alert("Ooops☹  （Code Error：403 Forbidden），……");
                    /* 对403的处理 */
                    return;
                }
                else {
                    alert("Ooops☹  （Code Error：" + request.status + "），……");
                    /* 对出现了其他错误代码所示错误的处理  */
                    return;
                }
            }
        }
        //把请求发送到服务器上的指定文件（url指向的文件）进行处理
        xmlHttp.open("GET", url, true);    //true表示异步处理
        xmlHttp.send();
    }
</script>
</body>
</html>