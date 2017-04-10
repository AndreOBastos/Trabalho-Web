<%-- 
    Document   : index
    Created on : Jan 2, 2016, 12:23:06 PM
    Author     : Andre
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tools.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
.header {
    text-align:right;
    padding:5px;
    height:250px;
    overflow:hidden;
    background-image:url("Untitled.jpg");
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
.produtos{
}
.produto{
    width:500px;
    height:400px;
    float:left;
    text-align:center;
    font-size:15px;
    font-family:calibri;
    margin-top:10px;
}
</style>

<%
    boolean logado;
    if (session != null && session.getAttribute("login") != null)
        logado = true;
    else
        logado = false;
    
    ValueProdutos vp = new ValueProdutos();
    
    vp.loadValues();
    
    ServletContext contexto = getServletContext();
    contexto.setAttribute("valueprodutos", vp);
    
    int qntC = 0;
    
    /*if (!logado){
        contexto.setAttribute("quantCarrinho",qntC);
    }
    else{
       
    }*/
    if (logado){
        User u;
        u = (User) session.getAttribute("usuario");
        qntC = u.getC().qntCarrinho();
    }
    
    ArrayList<Produto> produtos = new ArrayList<Produto>();
    
    for (int i = 0;i < vp.qntProducts();i++){
        produtos.add(vp.getProduct(i+1));
    }
    
    /*Produto produto1 = new Produto("Kit Básico Azul Marinho", "produto1.jpg", 299.99);
    Produto produto2 = new Produto("Kit Básico Rosa", "produto2.jpg", 299.99);
    Produto produto3 = new Produto("Kit de 7 Peças Azul Marinho", "produto3.jpg", 349.99);
    Produto produto4 = new Produto("Kit de 7 Peças Preto e Vermelho", "produto4.jpg", 369.99);
    Produto produto5 = new Produto("Trocador de Fraldas", "produto5.jpg", 49.99);
    Produto produto6 = new Produto("Kit Rei Azul Marinho", "produto6.jpg", 369.99);
    Produto produto7 = new Produto("Kit Rainha Rosa", "produto7.jpg", 369.99);
    Produto produto8 = new Produto("Kit Básico com Mosquiteiro Rosa", "produto8.jpg", 349.99);*/
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
                    <%if(logado){%>
                    <br>
                    <div>
                        Itens no carrinho: <%=qntC%><br>
                        <a class="link" href="carrinho.jsp">Carrinho</a>
                    </div>
                    <%}%>
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
            <%--Produtos--%>
            <div class="produtos">
                <%for (int i = 0;i < vp.qntProducts();i++){ %>
                <div class="produto">
                    <img float="top" width="400px" height="233px" src="<%=produtos.get(i).getImagem() %>">
                    <div position="absolute" top="250px">
                        <%=produtos.get(i).getNome()%>, <%=produtos.get(i).getPreco()%> 
                        <%if(logado){%>
                            <a class="link" href="AddCart?item=<%=i+1%>">+</a> 
                        <%}%>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
