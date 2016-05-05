<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

    <div class="card">
        <div class="card-header">
            <h2>Striped rows
                <small>Add zebra-striping to any table row within the tbody</small>
            </h2>
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
            <h2>Contextual classes
                <small>Use contextual classes to color table rows or individual cells.</small>
            </h2>
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