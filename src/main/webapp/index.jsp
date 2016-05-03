<%@ page language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Link Cloud</title>
    <!-- Vendor CSS -->
    <link href="/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
    <link href="/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
    <link href="/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css"
          rel="stylesheet">
    <!-- CSS -->
    <link href="/css/app.min.1.css" rel="stylesheet">
    <link href="/css/app.min.2.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp"%>
<section id="main">
    <%@include file="sidebar.jsp"%>
    <section id="content">
        <div class="container">
            <div class="block-header">
                <h2>用户信息管理</h2>

                <ul class="actions">
                    <li>
                        <a href="">
                            <i class="zmdi zmdi-trending-up"></i>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="zmdi zmdi-check-all"></i>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="" data-toggle="dropdown">
                            <i class="zmdi zmdi-more-vert"></i>
                        </a>

                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <a href="">Refresh</a>
                            </li>
                            <li>
                                <a href="">Manage Widgets</a>
                            </li>
                            <li>
                                <a href="">Widgets Settings</a>
                            </li>
                        </ul>
                    </li>
                </ul>

            </div>

            <div class="card">
                <div class="card-header">
                    <h2>Basic Table
                        <small>Basic example without any additional modification classes</small>
                    </h2>
                </div>

                <div class="card-body table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                            <th>Nickname</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Alexandra</td>
                            <td>Christopher</td>
                            <td>@makinton</td>
                            <td>Ducky</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Madeleine</td>
                            <td>Hollaway</td>
                            <td>@hollway</td>
                            <td>Cheese</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Sebastian</td>
                            <td>Johnston</td>
                            <td>@sebastian</td>
                            <td>Jaycee</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Mitchell</td>
                            <td>Christin</td>
                            <td>@mitchell4u</td>
                            <td>AdskiDeAnus</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Elizabeth</td>
                            <td>Belkitt</td>
                            <td>@belkitt</td>
                            <td>Goat</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Benjamin</td>
                            <td>Parnell</td>
                            <td>@wayne234</td>
                            <td>Pokie</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Katherine</td>
                            <td>Buckland</td>
                            <td>@anitabelle</td>
                            <td>Wokie</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>Nicholas</td>
                            <td>Walmart</td>
                            <td>@mwalmart</td>
                            <td>Spike</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>



        </div>
    </section>
</section>
<%@include file="footer.jsp"%>

<!-- Javascript Libraries -->
<script src="/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="/vendors/bower_components/jquery.nicescroll/jquery.nicescroll.min.js"></script>
<script src="/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>

<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="/vendors/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
<![endif]-->

<script src="/js/functions.js"></script>
<script src="/js/demo.js"></script>


</body>
</html>