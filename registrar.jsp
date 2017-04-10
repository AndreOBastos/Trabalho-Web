<%-- 
    Document   : registrar
    Created on : Jan 5, 2016, 9:03:47 PM
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
.formulario{
    position:absolute;
    top:50%;
    left:50%;
    height:300px;
    width:300px;
    text-align:left;
    clear:both;
}
.formulario #write{
    position:absolute;
    clear:both;
    width:70%;
    right:0px;
}
</style>

<%
    boolean logado;
    if (session != null && session.getAttribute("login") != null)
        logado = true;
    else
        logado = false;
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
            <div class="formulario">
                <form action="RegistrationServlet" method="post">
                    <label>Nome:</label> <input id="write" type="text" name="nome" /><br/>
                    <label>Endereço:</label> <input id="write" type="text" name="endereco" /><br/>
                    <label>Login:</label> <input id="write" type="text" name="login" /><br/>
                    <label>Senha:</label> <input id="write" type="password" name="senha" /><br/>
                    <input type="submit" value="Registrar"/>
                </form>
            </div>
        </div>
    </body>
</html>
