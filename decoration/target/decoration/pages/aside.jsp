<%--
  Created by IntelliJ IDEA.
  User: Yangchow
  Date: 2020-03-11
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <div class="user-panel">
            <div class="pull-left image">
                <img src="${sessionScope.USER_SESSION.picture}" class="img-circle user_pic" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.USER_SESSION.name}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> ${sessionScope.USER_SESSION.roleName}</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="搜索">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <c:forEach var="menuDto" items="${menuDtoList}" varStatus="status">
                <%--一级菜单--%>
                <c:if test="${menuDto.menuDtoList.size()==0}">
                    <li
                            <c:if test="${menuId==menuDto.id}">
                                class="active"
                            </c:if>
                    >
                        <a href="<c:url value="${menuDto.menuUrl}"/>">
                            <i class="fa ${menuDto.menuIcon}"></i>
                            <span>${menuDto.menuName}</span>
                            <span class="pull-right-container"></span>
                        </a>
                    </li>
                </c:if>
                <%--二级菜单--%>
                <c:if test="${menuDto.menuDtoList.size()>0}">
                    <li
                            class="treeview
                            <c:forEach var="menu" items="${menuDto.menuDtoList}" varStatus="status">
                                <c:if test="${menuId==menu.id}">
                                   active
                                </c:if>
                            </c:forEach>"
                    >
                        <a href="#">
                            <i class="fa ${menuDto.menuIcon}"></i>
                            <span>${menuDto.menuName}</span>
                            <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu">
                            <c:forEach var="menu" items="${menuDto.menuDtoList}" varStatus="status">
                                <li <c:if test="${menuId==menu.id}">
                                    class="active"
                                </c:if>
                                ><a href="<c:url value="${menu.menuUrl}"/>"><i
                                        class="fa fa-circle-o"></i>${menu.menuName}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>