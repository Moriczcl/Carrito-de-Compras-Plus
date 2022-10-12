<%@page import="com.emergentes.Producto"%>
<%@page import="java.util.ArrayList"%>
<% 
if(session.getAttribute("almacen")==null){
    ArrayList<Producto>lisaux=new  ArrayList<Producto>();
    session.setAttribute("almacen", lisaux);
    }
    
    ArrayList<Producto>alm=(ArrayList<Producto>)session.getAttribute("almacen");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Carrito de Compras Plus</h1>
        <form action="MainServlet" method="post">
        <table>
            <tr>
                <td>id</td>
                <td><input type="text" name="id" value=""size="2"></td>
            </tr>
            <tr>
                <td>Producto</td>
                <td><input type="text" name="producto"></td>
            </tr>
            <tr>
                <td>Cantidad</td>
                <td><input type="text" name="cantidad"</td>
            </tr>
            <tr>
                <td>Precio</td>
                <td><input type="text" name="precio"</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="ProcesaR"</td>
            </tr>
        </table>
        </form>
        <a href="MainServlet?op=vaciar">Vaciar Carrito</a>
        
        <h2>Contenido de Carrito</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th></th>
                </tr>
            </thead>
            <%
            if(alm!=null) {
                for (Producto p : alm) {       
            %>
            <tbody>
                <tr>
                    <td><%=p.getId() %></td>
                    <td><%=p.getProducto() %></td>
                    <td><%=p.getCantidad() %></td>
                    <td><%=p.getPrecio() %></td>
                    <td><a href="MainServlet?op=eliminar&id=<%=p.getId() %>">X</a></td>
                </tr>
            </tbody>
            <%
                }
            }
            %>
        </table>

    </body>
</html>
