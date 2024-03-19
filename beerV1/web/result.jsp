<%@page import="java.util.*"%>

<html>
<body>
<h1 align="center">Beer Recommendations JSP</h1>
<p>
    <%
        List styles = (List) request.getAttribute("styles");
        for (Object s : styles) {
            out.println("<br>try : " + s);
        }
    %>
</p>
</body>
</html>