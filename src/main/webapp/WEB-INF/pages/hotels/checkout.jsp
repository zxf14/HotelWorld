<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>退房</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-hotel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="checkout">
<%@ include file="asides.jsp"%>
<div class="container">
<%@ include file="header.jsp"%>
<main class="panel-group">
    <div class="panel-heading">
        <h3 class="panel-title">HotelWorld 入住信息</h3>
    </div>
    <div class="panel-body">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>入住日期</th>
                    <th>退房日期</th>
                    <th>房间类型</th>
                    <th>住客姓名</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${checkinList}" var="checkin">
                <tr>
                    <td>${checkin.inTime.substring(0,10)}</td>
                    <td>${checkin.outTime.substring(0,10)}</td>
                    <td>${checkin.roomTypeName}</td>
                    <td>${checkin.user1} ${checkin.user2}</td>
                    <td id="${checkin.id}"><button class="btn btn-sm btn-primary">退房</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
    

</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script>
    $.focusNav(2);
    $table=$('table');
    $table.on('click','button',checkout);
    function checkout(e) {
        var target=e.target;
        $.ajax({
            type:"POST",
            url:"checkoutPost",
            data:{checkinId:target.parentNode.id},
            success:function () {
                target.parentNode.innerHTML="已退房";
            }
        });

    }

</script>
</body>
</html>