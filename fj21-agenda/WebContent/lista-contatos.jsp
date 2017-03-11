<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="cabecalho.jsp"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao"/>
	
	<table border="1">
	    <tr bgcolor="0000FF" font-color="ffffff">
	    	<th> nome</th>
	    	<th> emails</th>
	    	<th>endereco</th>
	    	<th>Data Nascimento</th>
	    </tr>	
		<!--  pecorre contatos montando as linhas da tabela -->
		<c:forEach var="contato" varStatus = "id" items="${dao.lista}">

		<tr bgcolor="#${id.count%2==0?'ffcc00':'ffffff'}">
			<td>${contato.nome}</td>
			<td>
				<c:if test="${not empty contato.email}">
					<a href="mailto:${contato.email}">${contato.email}</a>
				</c:if>
			</td>
			<td>${contato.endereco}</td>
			<td>
				<fmt:formatDate value="${contato.dataNascimento.time}"
					pattern="dd/MM/yyyy" />
			</td>
			</tr>		
		</c:forEach>			
	</table>
	<c:import url="rodape.jsp" />
	</center>
</body>
</html>