<%@ page import="model.dto.tree.TreeManagement" %>
<%@ page import="model.dto.user.User" %>
<%@ page import="model.util.servlet.ServletUtil" %><%--
  Created by IntelliJ IDEA.
  User: nullpo299
  Date: 2019/09/23
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    final String SERVLET_LOGOUT = ServletUtil.getSERVLET_LOGOUT(true);
    final User user = (User) session.getAttribute("USER");
    final TreeManagement tm = ((TreeManagement) session.getAttribute("TREE_MANAGEMENT"));
    System.out.println(tm.getSubTree().toJson().replaceAll("\"", "\\\\\"")); //TODO debug code here.
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <title>MyDrive</title>
    <!-- BootstrapのCSS読み込み -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- BootstrapのJS読み込み -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- fontの読み込み-->
    <link href="https://fonts.googleapis.com/css?family=Alegreya+Sans+SC&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/cd42dc4295.js" crossorigin="anonymous"></script>

    <!-- jQuery読み込み -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!-- 自分のcss , js の読み込み-->
    <script>
        const origin_tree = JSON.parse("{\"1\":[{\"id\":\"2\",\"parentId\":\"1\",\"name\":\"nullpo299\",\"isDirectory\":\"true\"}],\"2\":[{\"id\":\"3\",\"parentId\":\"2\",\"name\":\"super\",\"isDirectory\":\"true\"},{\"id\":\"6\",\"parentId\":\"2\",\"name\":\"outfile\",\"isDirectory\":\"false\"}],\"3\":[{\"id\":\"4\",\"parentId\":\"3\",\"name\":\"multi\",\"isDirectory\":\"true\"}],\"4\":[{\"id\":\"5\",\"parentId\":\"4\",\"name\":\"otinpo\",\"isDirectory\":\"true\"}]}");
        const rootId = decodeURI(origin_tree["1"]["0"].id);
    </script>
    <script src="../myJs/upload.js"></script>
    <script src="../myJs/general.js"></script>
    <script src="../myJs/tree.js"></script>
    <script src="../myJs/files.js"></script>
    <script src="../myJs/contextMenu.js"></script>
    <script src="../js/funcResizeBox.js"></script>
    <script src="../myJs/toolbar.js"></script>
    <link rel="stylesheet" href="../myCss/main.css">
</head>
<body>
<header>
    <span class="drawer">
        <input id="nav-input" type="checkbox" class="nav-unshown">
        <label id="nav-open" for="nav-input"><span></span></label>
    </span>
    <span class="logo-container">
        <h1 class="logo">MyDrive</h1>
    </span>
    <div class="setting-container">
        <span class="setting-items" id="profile">
            <a href="#">
                <i class="fas fa-user"></i>
            </a>
        </span>
        <span class="setting-items" id="setting">
            <a href="#">
                <i class="fas fa-cog"></i>
            </a>
        </span>
        <span class="setting-items" id="logout">
            <a href="<%=SERVLET_LOGOUT%>">
                <i class="material-icons">exit_to_app</i>
            </a>
        </span>
    </div>
</header>
<div class="inner">
    <aside id="side-nav">
        <div id="nav-content">
            <ul>
                <li class="current" id="home">
                    <i class="material-icons">
                        home
                    </i>
                    <span class="side-item nav-unshown">Home</span>
                </li>
                <li id="favorites">
                    <i class="material-icons">
                        bookmark
                    </i>
                    <span class="side-item nav-unshown">Bookmark</span>
                </li>
                <li id="search">
                    <i class="material-icons">
                        search
                    </i>
                    <span class="side-item nav-unshown">Search</span>
                </li>
                <li id="trash">
                    <i class="material-icons">
                        delete
                    </i>
                    <span class="side-item nav-unshown">Trash</span>
                </li>
            </ul>
        </div>
    </aside>
    <main class="home">
        <div id="resize">
            <ul class="root">
                <li class="root" id="parent"></li>
            </ul>
        </div>
        <div class="content">
            <div class="tool-bar">
                <span class="tool">
                    <ul class="parent">
                        <li>
                            <a>new</a>
                            <ul class="dropdwn_menu">
                                <li>file</li>
                                <li>directory</li>
                            </ul>
                        </li>
                    </ul>
                </span>
                <span class="tool">
                    <ul class="parent">
                        <li>
                            <a>upload</a>
                            <ul class="dropdwn_menu">
                                <li>file</li>
                                <li>directory</li>
                            </ul>
                        </li>
                    </ul>
                </span>
                <span class="tool">
                    <ul>
                        <li>
                            <a>download</a>
                        </li>
                    </ul>
                </span>
                <span class="tool">
                    <ul>
                        <li>
                            <a>move</a>
                        </li>
                    </ul>
                </span>
                <span class="tool">
                    <ul>
                        <li>
                            <a>delete</a>
                        </li>
                    </ul>
                </span>
            </div>
            <div class="breadcrumbs-area">
                <ol class="breadcrumbs">
                    <li class="breadcrumbs-item"><a href="#">Home</a></li>
                    <li class="breadcrumbs-item"><a href="#">unchi</a></li>
                    <li class="breadcrumbs-item current"><a href="#">aaaaaaaaaaa</a></li>
                </ol>
            </div>
            <div id="files-area">
                <div class="dir" draggable="true">
                    <i class="fas fa-file-alt"></i>
                    <p>aaa</p>
                    <input type="checkbox" id="11">
                    <label class="decorated-box" for="11"></label>
                </div>
                <div class="dir">
                    <i class="fas fa-folder"></i>
                    <p>Nakazawa Haruzi</p>
                    <input type="checkbox" id="12">
                    <label class="decorated-box" for="12"></label>
                </div>
                <div class="dir">
                    <i class="fas fa-folder"></i>
                    <p>Nakazawa Haruzi</p>
                    <input type="checkbox" id="13">
                    <label class="decorated-box" for="13"></label>
                </div>
                <div class="dir">
                    <i class="fas fa-folder"></i>
                    <p>Nakazawa Haruzi</p>
                    <input type="checkbox" id="14">
                    <label class="decorated-box" for="14"></label>
                </div>
                <div class="dir">
                    <i class="fas fa-folder"></i>
                    <p>Nakazawa Haruziaaaaaaaaaaaaaaaaaaaaaa</p>
                    <input type="checkbox" id="15">
                    <label class="decorated-box" for="15"></label>
                </div>
                <div class="dir">
                    <i class="fas fa-folder"></i>
                    <p>Nakazawa Haruziaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
                    <input type="checkbox" id="16">
                    <label class="decorated-box" for="16"></label>
                </div>
                <div class="dir">
                    <i class="fas fa-folder"></i>
                    <p>Nakazawa Haruzi</p>
                    <input type="checkbox" id="17">
                    <label class="decorated-box" for="17"></label>
                </div>
            </div>
        </div>
        <div id="context-menu">
            <ul>
                <li class="context-item">New</li>
                <li class="context-item">Upload</li>
                <li class="context-item">Download</li>
                <li class="context-item">Move</li>
                <li class="context-item">Delete</li>
            </ul>
        </div>
    </main>
    <main class="favorites" hidden>
    </main>
    <main class="search" hidden>
    </main>
    <main class="trash" hidden>
    </main>
</div>
</body>
</html>
