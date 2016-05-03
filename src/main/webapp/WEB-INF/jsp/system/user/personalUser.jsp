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
    <link href="/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">


    <!-- CSS -->
    <link href="/css/app.min.1.css" rel="stylesheet">
    <link href="/css/app.min.2.css" rel="stylesheet">
</head>
<body>
<header id="header">
    <ul class="header-inner">
        <li id="menu-trigger" data-trigger="#sidebar">
            <div class="line-wrap">
                <div class="line top"></div>
                <div class="line center"></div>
                <div class="line bottom"></div>
            </div>
        </li>

        <li class="logo hidden-xs">
            <a href="tables.html">Link Cloud</a>
        </li>

        <ul class="pull-right">
            <ul class="top-menu">
                <li id="toggle-width">
                    <div class="toggle-switch">
                        <input id="tw-switch" type="checkbox" hidden="hidden">
                        <label for="tw-switch" class="ts-helper"></label>
                    </div>
                </li>
                <li id="top-search">
                    <a class="tm-search" href=""></a>
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="tm-message" href=""><i class="tmn-counts">1</i></a>
                    <div class="dropdown-menu dropdown-menu-lg pull-right">
                        <div class="listview">
                            <div class="lv-header">
                                Messages
                            </div>
                            <div class="lv-body">
                                <a class="lv-item" href="">
                                    <div class="media">
                                        <div class="pull-left">
                                            <img class="lv-img-sm" src="img/profile-pics/1.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <div class="lv-title">David Belle</div>
                                            <small class="lv-small">Cum sociis natoque penatibus et magnis dis parturient montes</small>
                                        </div>
                                    </div>
                                </a>

                            </div>
                            <a class="lv-footer" href="">View All</a>
                        </div>
                    </div>
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="tm-notification" href=""><i class="tmn-counts">2</i></a>
                    <div class="dropdown-menu dropdown-menu-lg pull-right">
                        <div class="listview" id="notifications">
                            <div class="lv-header">
                                Notification

                                <ul class="actions">
                                    <li class="dropdown">
                                        <a href="" data-clear="notification">
                                            <i class="zmdi zmdi-check-all"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="lv-body">
                                <a class="lv-item" href="">
                                    <div class="media">
                                        <div class="pull-left">
                                            <img class="lv-img-sm" src="img/profile-pics/1.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <div class="lv-title">David Belle</div>
                                            <small class="lv-small">Cum sociis natoque penatibus et magnis dis parturient montes</small>
                                        </div>
                                    </div>
                                </a>

                            </div>

                            <a class="lv-footer" href="">View Previous</a>
                        </div>

                    </div>
                </li>
                <li class="dropdown hidden-xs">
                    <a data-toggle="dropdown" class="tm-task" href=""><i class="tmn-counts">2</i></a>
                    <div class="dropdown-menu pull-right dropdown-menu-lg">
                        <div class="listview">
                            <div class="lv-header">
                                Tasks
                            </div>
                            <div class="lv-body">
                                <div class="lv-item">
                                    <div class="lv-title m-b-5">HTML5 Validation Report</div>

                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
                                            <span class="sr-only">95% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="lv-item">
                                    <div class="lv-title m-b-5">Google Chrome Extension</div>

                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <a class="lv-footer" href="">View All</a>
                        </div>
                    </div>
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="tm-settings" href=""></a>
                    <ul class="dropdown-menu dm-icon pull-right">
                        <li class="hidden-xs">
                            <a data-action="fullscreen" href=""><i class="zmdi zmdi-fullscreen"></i> Toggle Fullscreen</a>
                        </li>
                        <li>
                            <a data-action="clear-localstorage" href=""><i class="zmdi zmdi-delete"></i> Clear Local Storage</a>
                        </li>
                        <li>
                            <a href=""><i class="zmdi zmdi-face"></i> Privacy Settings</a>
                        </li>
                        <li>
                            <a href=""><i class="zmdi zmdi-settings"></i> Other Settings</a>
                        </li>
                    </ul>
                </li>
                <li class="hidden-xs" id="chat-trigger" data-trigger="#chat">
                    <a class="tm-chat" href=""></a>
                </li>
                </li>
            </ul>
        </ul>

        <!-- Top Search Content -->
        <div id="top-search-wrap">
            <input type="text">
            <i id="top-search-close">&times;</i>
        </div>
    </ul>
</header>

<section id="main">
    <aside id="sidebar">
        <div class="sidebar-inner c-overflow">
            <div class="profile-menu">
                <a href="">
                    <div class="profile-pic">
                        <img src="img/profile-pics/1.jpg" alt="">
                    </div>

                    <div class="profile-info">
                        Malinda Hollaway

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
                        <a href="login.html"><i class="zmdi zmdi-time-restore"></i> 退出</a>
                    </li>
                </ul>
            </div>

            <ul class="main-menu">
                <li><a href="media.html"><i class="zmdi zmdi-home"></i> 设备空间</a></li>
                <li class="sub-menu">
                    <a class="active" href="tables.html"><i class="zmdi zmdi-widgets"></i>用户管理</a>

                    <ul>
                        <li><a href="users.html">个人用户</a></li>
                        <li><a href="company_users.html">企业用户</a></li>
                    </ul>
                </li>
                <li>
                    <a href="devices.html"><i class="zmdi zmdi-view-list"></i>设备管理</a>
                </li>
                <li class="sub-menu">
                    <a href="#"><i class="zmdi zmdi-collection-text"></i> 素材管理</a>

                    <ul>
                        <li><a href="image.html">图片及微场景广告</a></li>
                        <li><a href="#">视频广告素材</a></li>
                        <li><a href="media.html">直播视频</a></li>
                        <li><a href="#">点播视频</a></li>
                        <li><a href="#">远程视频</a></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href=""><i class="zmdi zmdi-trending-up"></i>统计分析</a>
                    <ul>
                        <li><a href="#">Default</a></li>
                        <li><a href="#">Timeline</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href=""><i class="zmdi zmdi-layers"></i>日志记录</a>
                    <ul>
                        <li><a href="#">登陆日志</a></li>
                        <li><a href="#">操作日志</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </aside>

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
                    <h2>Basic Table <small>Basic example without any additional modification classes</small></h2>
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

            <div class="card">
                <div class="card-header">
                    <h2>Striped rows <small>Add zebra-striping to any table row within the tbody</small></h2>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped">
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


            <div class="card">
                <div class="card-header">
                    <h2>Contextual classes <small>Use contextual classes to color table rows or individual cells.</small></h2>
                </div>

                <div class="table-responsive">
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
                        <tr class="active">
                            <td>1</td>
                            <td>Alexandra</td>
                            <td>Christopher</td>
                            <td>@makinton</td>
                            <td>Ducky</td>
                        </tr>
                        <tr class="info">
                            <td>3</td>
                            <td>Sebastian</td>
                            <td>Johnston</td>
                            <td>@sebastian</td>
                            <td>Jaycee</td>
                        </tr>
                        <tr class="warning">
                            <td>4</td>
                            <td>Mitchell</td>
                            <td>Christin</td>
                            <td>@mitchell4u</td>
                            <td>AdskiDeAnus</td>
                        </tr>
                        <tr class="success">
                            <td>2</td>
                            <td>Madeleine</td>
                            <td>Hollaway</td>
                            <td>@hollway</td>
                            <td>Cheese</td>
                        </tr>
                        <tr class="danger">
                            <td>5</td>
                            <td>Elizabeth</td>
                            <td>Belkitt</td>
                            <td>@belkitt</td>
                            <td>Goat</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </section>
</section>

<footer id="footer">
    Copyright &copy; 2015 Material Admin

    <ul class="f-menu">
        <li><a href="">Home</a></li>
        <li><a href="">Dashboard</a></li>
        <li><a href="">Reports</a></li>
        <li><a href="">Support</a></li>
        <li><a href="">Contact</a></li>
    </ul>
</footer>

<!-- Older IE warning message -->
<!--[if lt IE 9]>
<div class="ie-warning">
    <h1 class="c-white">Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="img/browsers/chrome.png" alt="">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="img/browsers/firefox.png" alt="">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="img/browsers/opera.png" alt="">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="img/browsers/safari.png" alt="">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="img/browsers/ie.png" alt="">
                    <div>IE (New)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->


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