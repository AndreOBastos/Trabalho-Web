<%-- 
    Document   : carrinho
    Created on : Jan 5, 2016, 9:01:53 PM
    Author     : Andre
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="tools.*"%>
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
.linkbasic {
    background:none;
    border:none;
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
.produto{
    width:500px;
    height:400px;
    float:left;
    text-align:center;
    font-size:14px;
    font-family:calibri;
}
table.carrinho,tr.carrinho,td.carrinho{
    border:2px solid black;
    border-collapse:collapse;
}

table.carrinho{
    margin-top:15px;
}
.botoes{
    margin-top:15px;
    margin-bottom:15px;
}
</style>

<%
    boolean logado;
    if (session != null && session.getAttribute("login") != null)
        logado = true;
    else
        logado = false;

    ServletContext contexto = getServletContext();
    
    
    Map<Integer,Produto> list;
    
    float total = 0;
    
    User u;
    u = (User) session.getAttribute("usuario");
    list = u.getC().getItens();
    total = u.getC().getValor();
    int CompraId = u.getC().getId();
    System.out.println(CompraId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loja Tababy</title>
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
                <%if(!logado){%>
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
            </div>
                    Você deve estar logado!
                <%}else{%>
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
            </div>
                <%--Aqui é onde imprime todos os objetos do carrinho--%>
                <%if (total <= 0){%>
                    Você não adicionou nada ao carrinho!
                <%}else{%>
                <div class="produtos">
                    <table align="center" class="carrinho">
                        <%  int i = 1;
                            for(Integer id : list.keySet()){%>
                            <tr class="carrinho"> <%-- Linha para cada produto --%>
                                <td class="carrinho" width="30px" align="center"><%-- id do produto --%>
                                    <%=i%> <%-- basicamente, tu tem que trocar o que tem dentro dos blocos "<%= %>" pelo valor correspondente do banco --%>
                                </td>
                                <%i++;
                                  Produto p = list.get(id); %>
                                <td class="carrinho" width="420px" align="center"><%-- imagem do produto --%>
                                    <img src="<%=p.getImagem()%>" height="200px" width="400px">
                                </td>
                                <td class="carrinho" width="420px" align="center"><%-- nome do produto --%>
                                    <%=p.getNome()%>
                                </td>
                                <td class="carrinho" width="100px" align="center"><%-- valor do produto --%>
                                    <%=p.getPreco()%>
                                </td>
                                <td class="carrinho" width="100px" align="center">
                                    <a class="link" href="RemoverItem?id=<%=id%>">Remover</button>
                                </td>
                            </tr>
                        <%}%>
                            <tr>
                                <td class="carrinho" width="30px" align="center"></td>
                                <td class="carrinho" width="420px" align="center"></td>
                                <td class="carrinho" width="100px" align="center"></td>
                                <td class="carrinho" width="100px" align="center"> <%=String.format("%.2f", total)%> </td>
                                <td class="carrinho" width="100px" align="center"></td>
                            </tr>
                    </table>
                </div>
                <div class="botoes" align="center" padding-top="10px">
                    <a class="link" href="PayCompra?id=<%=CompraId%>">Comprar >>></a>
                    <a class="link" href="DelCompra?id=<%=CompraId%>">Deletar Carrinho</a>
                </div>
                <%}%>
            <%}%>
        </div>
    </body>
</html>
