<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>主页分类</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${ctxstatic}/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctxstatic}/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${ctxstatic}/vendor/linearicons/style.css">
	<link rel="stylesheet" href="${ctxstatic}/vendor/toastr/toastr.min.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${ctxstatic}/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="${ctxstatic}/css/demo.css">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="${ctxstatic}/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${ctxstatic}/img/favicon.png">
	
	<%@include file="/common/adminCss.jspf"%>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<%@ include file="/admin/common/navbar.jsp" %>
		
		<%@ include file="/admin/common/leftnav.jsp" %>
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					
					<div id="toastr-demo" class="panel">
						<form id="form" name="form">
								<div class="panel-heading">
									<h3 class="panel-title" <%-- align="center" --%>>主页分类设置</h3>
									
								</div>
								<div id="toolbar" class="btn-group">
            						
            						<!--<a href=""><button id="btn_add" type="button" class="btn btn-default">
                						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            						</button></a>
            						 <button id="btn_edit" type="button" class="btn btn-default">
                						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            						</button>
            						<button id="btn_delete" type="button" class="btn btn-default">
               							 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            						</button> -->
        						</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
											    <label for="name">请选择第一个大类</label>
											    <select class="form-control" id="itemCategory_id1" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 1}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 1}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第二个大类</label>
											    <select class="form-control" id="itemCategory_id2" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 2}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 2}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第三个大类</label>
											    <select class="form-control" id="itemCategory_id3" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 3}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 3}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第四个大类</label>
											    <select class="form-control" id="itemCategory_id4" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 4}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 4}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第五个大类</label>
											    <select class="form-control" id="itemCategory_id5" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 5}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 5}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第六个大类</label>
											    <select class="form-control" id="itemCategory_id6" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 6}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 6}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<button type="button" onclick="save()" class="btn btn-default">保存</button>
										</div>
										<div class="col-md-6">
										 	<div class="form-group">
											    <label for="name">请选择第七个大类</label>
											    <select class="form-control" id="itemCategory_id7" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 7}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 7}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第八个大类</label>
											    <select class="form-control" id="itemCategory_id8" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 8}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 8}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第九个大类</label>
											    <select class="form-control" id="itemCategory_id9" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 9}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 9}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第十个大类</label>
											    <select class="form-control" id="itemCategory_id10" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 10}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 10}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第十一个大类</label>
											    <select class="form-control" id="itemCategory_id11" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 11}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 11}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											<div class="form-group">
											    <label for="name">请选择第十二个大类</label>
											    <select class="form-control" id="itemCategory_id12" name="itemCategoryId">
											       <option value="0">不设置</option>
											       <c:forEach var="indexCategory" items="${indexCategorys}">
											       		<c:if test="${indexCategory.id == 12}">
											       			<option value="${indexCategory.itemCategory.id}" selected="selected">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       		<c:if test="${indexCategory.id != 12}">
											       			<option value="${indexCategory.itemCategory.id}">${indexCategory.itemCategory.name}</option>
											       		</c:if>
											       </c:forEach>
											    </select>
											</div>
											
										</div>
									</div> 
								</div>
								
							</form>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="${ctxstatic}/vendor/jquery/jquery.min.js"></script>
	<script src="${ctxstatic}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctxstatic}/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${ctxstatic}/scripts/klorofil-common.js"></script>
	
	<%@include file="/common/adminJs.jspf"%>
	
	<script >
	function save() {
       	$.ajax({
            type: 'POST',
            url: '${ctx}/admin/system/indexCategorySave',
            data: $('#form').serialize(),
            dataType: 'json',
            success: function (data) {
                if (data.success) {
                	 swal(
		               	{   
               		      title: "提示信息",   
               		      text: data.msg,  
               		      type: "info",
               		      allowOutsideClick: false,
               		      background: '#FFF',
               		      confirmButtonColor: '#64C9C1',
               		      confirmButtonText: "确定"
	               		  }).then(
	               		      function () {
	               		      	location.href='${ctx}/admin/system/indexCategory';
	               		      }
	             		) 
                }
            },
            error: function () {
            	swal(
               		  {   
               		      title: "提示信息",   
               		      text: "出错了,请重试!",  
               		      type: "info",
               		      allowOutsideClick: false,
               		      background: '#FFF',
               		      confirmButtonColor: '#64C9C1',
               		      confirmButtonText: "确定"
               		  }).then(
               		      function () {
               		      	location.href='${ctx}/admin/system/indexCategory';
               		      }
          		    ) 
            }
        });
       }
	</script>
</body>

</html>
