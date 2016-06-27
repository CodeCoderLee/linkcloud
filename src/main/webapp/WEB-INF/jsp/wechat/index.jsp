<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/6/24
  Time: 下午1:04
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<c:redirect url="${ctx}/space/show.shtml?openId=${openId}"/>