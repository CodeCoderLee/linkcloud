<%--
  Created by IntelliJ IDEA.
  User: bcc
  Date: 16/5/3
  Time: 下午7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<aside id="sidebar">
    <div class="sidebar-inner c-overflow">
        <div class="profile-menu">
            <a href="">
                <div class="profile-pic">
                    <c:choose>
                        <c:when test="${sessionScope.user.sex==0}">
                            <img src="img/profile-pics/1.jpg" alt="">
                        </c:when>
                        <c:otherwise>
                            <img src="img/profile-pics/2.jpg" alt="">
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="profile-info">
                    ${sessionScope.user.username}
                    <i class="zmdi zmdi-arrow-drop-down"></i>
                </div>
            </a>

            <ul class="main-menu">
                <li>
                    <a href="profile-about.html"><i class="zmdi zmdi-account"></i> 个人信息</a>
                </li>
                <li>
                    <a href=""><i class="zmdi zmdi-settings"></i> 设置</a>
                </li>
                <li>
                    <a href="logout.shtml"><i class="zmdi zmdi-time-restore"></i> 退出</a>
                </li>
            </ul>
        </div>

        <div id="menuList">
            <ul class="main-menu">
                <c:forEach var="key" items="${sessionScope.resourceList}" varStatus="s">
                    <li <c:if test="${key.children.size()>0}"> class="sub-menu" </c:if> >
                        <a href="admin.jsp" <c:if test="${s.index == 0}">class="active" </c:if> ><i class="zmdi zmdi-home"></i>${key.name}</a>
                        <ul>
                            <c:forEach var="kc" items="${key.children}" varStatus="kcs">
                                <li <c:if test="${kcs.index==0}">class="active"</c:if> >
                                    <a href="javascript:void(0)"  class="active"
                                       nav-n="${key.name},${kc.name},${kc.resUrl}?id=${kc.id}"> <i
                                            class="fa fa-angle-right"></i> <span>${kc.name}</span>
                                    </a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>




        </div>

    </div>
</aside>
