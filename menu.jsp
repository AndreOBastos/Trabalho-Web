<%-- 
    Document   : menu
    Created on : Jan 5, 2016, 9:03:20 PM
    Author     : Andre
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="tools.*"%>

<style>
.header {
    text-align:right;
    padding:5px;
    height:250px;
    overflow:hidden;
}
.info{
    display:table;
    float:right;
    height:250px;
    overflow:hidden;
}
.link {
    text-decoration:none;
    color:orange;
}
.menu{
    height:27px;
    border-width:1px;
    border-top-style:solid;
    border-top-color:orange;
    border-bottom-style:solid;
    border-bottom-color:orange;
    border-left-style:none;
    border-right-style:none;
    background:yellow;
    overflow:hidden;
}
.menuleft{
    float:left;
    font-size:14px;
    font-family:calibri;
}
.menuright{
    float:right;
    font-size:14px;
    font-family:calibri;
}
.infocliente{
    margin-top: 10px;
    text-align: center;
}
table.menuinfo{
    border:2px solid black;
}
.infocompras{
    margin-top:10px;
}
</style>

<%
    boolean logado;
    if (session != null && session.getAttribute("login") != null)
        logado = true;
    else
        logado = false;
    
    String nome = new String("No name");
    String endereco = new String("No address");
    
    ServletContext contexto = getServletContext();
    
    Map<Integer,Float> lb = new HashMap<Integer,Float>();
    
    RelatoriosBD rbd = new RelatoriosBD();
    
    if (logado){
        User u;
        u = (User) session.getAttribute("usuario");
        nome = new String(u.getNome());
        endereco = new String(u.getEndereco());
        lb = rbd.LastBuy(u.getId());
    }
    
    boolean comprado1 = true;
    boolean comprado2 = true;
    boolean comprado3 = false;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%--Logotipo e Informações--%>
            <div class="header">
                <img src="tababy.png" height="230px" align="left">
                <div class="info">
                    <div display="table-cell" vertical-align="middle" height="33.3%">
                    Rua João Salgado, 152, Casa B<br>
                    Telefone: (85) 3214-1885
                    </div>
                </div>
            </div>

            <%--Menus--%>
            <div class="menu">
                <div class="menuleft">
                    <table>
                        <td>
                            <a class="link" href="index.jsp">Home</a>
                        </td>
                        <td>
                            |
                        </td>
                        <td>
                            <a class="link" href="sobre.jsp">Sobre</a>
                        </td>
                    </table>
                </div>
                <%if(logado){%>
                    <div class="menuright">
                        <table>
                            <td>
                                <a class="link" href="menu.jsp">Menu</a>
                            </td>
                            <td>
                                |
                            </td>
                            <td>
                                <a class="link" href="LogoutServlet">Deslogar</a>
                            </td>
                        </table>
                    </div>
                <%}else{%>
                    <div class="menuright">
                        <table>
                            <td>
                                <a class="link" href="login.jsp">Login</a>
                            </td>
                            <td>
                                |
                            </td>
                            <td>
                                <a class="link" href="registrar.jsp">Registrar-se</a>
                            </td>
                        </table>
                    </div>

                <%}%>
            </div>
            <div class="infocliente" width="300px">
                    Informação do Cliente:
                <table class="menuinfo" align="center">  <%-- Preenche os <%=%> com as informações necessárias, as que estão aí são só pra testar --%>
                    <tr>
                        <td>
                            Nome: <%=nome%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Endereço: <%=endereco%>
                        </td>
                    </tr>                    
                </table>
            </div>
            <div class="infocompras" width="500px" align="center">
                Últimas 3 compras:
                <table class="menuinfo"> <%-- substitui os valores fixos que pûs nos botões pelo valor total das compras, imagino que o banco de dados tenha como fornecer esse valor facilmente --%>
                    <%if (lb.size() < 1){%>
                        <tr>
                            <td>
                                Nenhuma compra realizada...
                            </td>
                        </tr>
                    <%}else{
                        int i = 1;
                        for (Integer id : lb.keySet()){ %>
                        <tr>
                            <td>
                                <a class="link" href="infocompra.jsp?id=<%=id%>">Compra <%=i%>: <%=lb.get(id)%></a>
                            </td>
                        </tr>
                        <%i++; }
                    }%>
                </table>
            </div>
        </div>
    </body>
</html>
