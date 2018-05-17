<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>商品添加</title>
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
	
	<link href="${ctxstatic}/vendor/BootstrapFileInput/css/bootstrap-fileinput.css" rel="stylesheet">
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
						<form id="form" role="form" enctype="multipart/form-data">
						<div >
							<h3 class="panel-title" style="margin-left: 30px;margin-top: 20px;">商品增改</h3>
							<div class="pull-right" style="margin-right: 100px;margin-top: -10px;">
							<button type="button" onclick="save()" class="btn btn-default">保存</button>
							</div>
						</div>
						<div class="panel-body">
				                <input id="item_id" name="item_id" value="${item.id}" type="hidden" />
				                <input id="itemDetail_id" name="itemDetail_id" value="${item.itemDetail.id}" type="hidden" />
				                <div class="col-md-6">
				                <div class="form-group">
								    <label for="name"><br/>名称</label>
								    <input type="text" class="form-control" id="name" name="name" value="${item.name}" placeholder="请输入名称">
								</div>
								<div class="form-group">
								    <label for="name">价格</label>
								    <input type="text" class="form-control" id="price" name="price" value="${item.price}" 
								    	maxlength="8"
								    placeholder="请输入价格">
								</div>
								<div class="form-group">
								    <label for="name">品牌</label>
								    <input type="text" class="form-control" id="brand" name="brand" value="${item.brand}" placeholder="请输入品牌">
								</div>
								<%-- <div class="form-group">
								    <label for="name">货号</label>
								    <input type="text" class="form-control" id="model" name="model" value="${item.model}" placeholder="请输入货号">
								</div> --%>
								<div class="form-group">
								    <label for="name">库存</label>
								    <input type="text" class="form-control" id="stock" name="stock" value="${item.stock}" 
								    	maxlength="4"
										onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
										onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"
								    	placeholder="请输入库存">
								</div>
								
								<%-- <div class="col-md-6">
								<div class="form-group">
								    <label for="name">选择大类</label>
								    <select class="form-control" id="itemCategoryDetail_id" name="itemCategoryDetail_id">
								       <c:forEach var="itemCategoryDetail" items="${itemCategoryDetails}">
								       		<c:if test="${itemCategoryDetail.id eq item.itemCategoryDetail.id}">
								       			<option value="${itemCategoryDetail.id}" selected="selected">${itemCategoryDetail.name}</option>
								       		</c:if>
								       		<c:if test="${itemCategoryDetail.id != item.itemCategoryDetail.id}">
								       			<option value="${itemCategoryDetail.id}">${itemCategoryDetail.name}</option>
								       		</c:if>
								       		
								       </c:forEach>
								    </select>
								  </div>
								  </div> --%>
								  <!-- <div class="col-md-6"> -->
								  <div class="form-group">
								    <label for="name">选择小类</label>
								    <select class="form-control" id="itemCategoryDetail_id" name="itemCategoryDetail_id">
								       <c:forEach var="itemCategoryDetail" items="${itemCategoryDetails}">
								       		<c:if test="${itemCategoryDetail.id eq item.itemCategoryDetail.id}">
								       			<option value="${itemCategoryDetail.id}" selected="selected">${itemCategoryDetail.name}</option>
								       		</c:if>
								       		<c:if test="${itemCategoryDetail.id != item.itemCategoryDetail.id}">
								       			<option value="${itemCategoryDetail.id}">${itemCategoryDetail.name}</option>
								       		</c:if>
								       		
								       </c:forEach>
								    </select>
								  </div>
								  <!-- </div> -->
								  
								  
								 
								 
								</div>
								<div class="col-md-6">
								<div class="form-group" id="uploadForm">
					                <div><label for="name">图片预览</label></div>
					                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload1">
					                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
					                        	<c:if test="${empty item.picture}">
					                        		<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${ctxstatic}/vendor/BootstrapFileInput/images/noimage.png" alt="" />
					                        	</c:if> 
					                        	<c:if test="${not empty item.picture}">
					                        	<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${nginxPic}/${item.picture}" alt="" />
					                        	</c:if>
					                    </div>
					                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
					                    <div>
					                        <span class="btn btn-primary btn-file">
					                            <span class="fileinput-new">选择文件</span>
					                            <span class="fileinput-exists">换一张</span>
					                            <input type="file" name="pic" id="pic" accept="image/jpeg">
					                        </span>
					                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
					                    </div>
					                </div>
					                
					                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload2">
					                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
					                        <c:if test="${empty item.itemDetail.picture1}">
					                        		<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${ctxstatic}/vendor/BootstrapFileInput/images/noimage.png" alt="" />
				                        	</c:if> 
				                        	<c:if test="${not empty item.itemDetail.picture1}">
				                        			<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${nginxPic}/${item.itemDetail.picture1}" alt="" />
				                        	</c:if>
					                    </div>
					                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
					                    <div>
					                        <span class="btn btn-primary btn-file">
					                            <span class="fileinput-new">选择文件</span>
					                            <span class="fileinput-exists">换一张</span>
					                            <input type="file" name="pic1" id="pic1" accept="image/jpeg">
					                        </span>
					                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
					                    </div>
					                </div>
					                
					                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload2">
					                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
					                        <c:if test="${empty item.itemDetail.picture2}">
					                        		<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${ctxstatic}/vendor/BootstrapFileInput/images/noimage.png" alt="" />
				                        	</c:if> 
				                        	<c:if test="${not empty item.itemDetail.picture2}">
				                        			<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${nginxPic}/${item.itemDetail.picture2}" alt="" />
				                        	</c:if>
					                    </div>
					                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
					                    <div>
					                        <span class="btn btn-primary btn-file">
					                            <span class="fileinput-new">选择文件</span>
					                            <span class="fileinput-exists">换一张</span>
					                            <input type="file" name="pic2" id="pic2" accept="image/jpeg">
					                        </span>
					                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
					                    </div>
					                </div>
					                
					                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload2">
					                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
					                        <c:if test="${empty item.itemDetail.picture3}">
					                        		<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${ctxstatic}/vendor/BootstrapFileInput/images/noimage.png" alt="" />
				                        	</c:if> 
				                        	<c:if test="${not empty item.itemDetail.picture3}">
				                        			<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${nginxPic}/${item.itemDetail.picture3}" alt="" />
				                        	</c:if>
					                    </div>
					                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
					                    <div>
					                        <span class="btn btn-primary btn-file">
					                            <span class="fileinput-new">选择文件</span>
					                            <span class="fileinput-exists">换一张</span>
					                            <input type="file" name="pic3" id="pic3" accept="image/jpeg">
					                        </span>
					                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
					                    </div>
					                </div>
					                
					                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload2">
					                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
					                        <c:if test="${empty item.itemDetail.picture4}">
					                        		<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${ctxstatic}/vendor/BootstrapFileInput/images/noimage.png" alt="" />
				                        	</c:if> 
				                        	<c:if test="${not empty item.itemDetail.picture4}">
				                        			<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${nginxPic}/${item.itemDetail.picture4}" alt="" />
				                        	</c:if>
					                    </div>
					                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
					                    <div>
					                        <span class="btn btn-primary btn-file">
					                            <span class="fileinput-new">选择文件</span>
					                            <span class="fileinput-exists">换一张</span>
					                            <input type="file" name="pic4" id="pic4" accept="image/jpeg">
					                        </span>
					                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
					                    </div>
					                </div>
					                
					                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload2">
					                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
					                        <c:if test="${empty item.itemDetail.picture5}">
					                        		<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${ctxstatic}/vendor/BootstrapFileInput/images/noimage.png" alt="" />
				                        	</c:if> 
				                        	<c:if test="${not empty item.itemDetail.picture5}">
				                        			<img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="${nginxPic}/${item.itemDetail.picture5}" alt="" />
				                        	</c:if>
					                    </div>
					                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
					                    <div>
					                        <span class="btn btn-primary btn-file">
					                            <span class="fileinput-new">选择文件</span>
					                            <span class="fileinput-exists">换一张</span>
					                            <input type="file" name="pic5" id="pic5" accept="image/jpeg">
					                        </span>
					                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
					                    </div>
					                </div>
					            </div>
								</div>
								
								<%-- <div class="form-group">
								    <label for="name">特性</label>
								    <textarea class="form-control" rows="5" id="chara" name="chara" placeholder="请输入特性">${item.itemDetail.chara}</textarea>
								</div>
								<div class="form-group">
								    <label for="name">规格</label>
								    <textarea class="form-control" rows="5" id="specifi" name="specifi" placeholder="请输入规格">${item.itemDetail.specifi}</textarea>
								</div>
								<div class="form-group">
								    <label for="name">清单</label>
								    <textarea class="form-control" rows="5" id="list" name="list" placeholder="请输入清单">${item.itemDetail.list}</textarea>
								</div> --%>
								
								<input id="user_id" name="user_id" type="hidden" value="${sessionScope.user.id}">
								<input id="action" name="action" type="hidden" value="action">
				                <input id="intro" name="intro" type="hidden" value="">
				                <!-- <button type="reset" class="btn btn-default">取消</button> -->
				        		<div class="form-group">
								    <label for="name">描述</label>
								    <div class="form-control" id="editor">${item.itemDetail.intro}</div>
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
	<script src="${ctxstatic}/vendor/BootstrapFileInput/js/bootstrap-fileinput.js"></script>

	<!-- ckeditor -->
	<script src="${ctxstatic}/vendor/ckeditor/ckeditor.js"></script>
	<script src="${ctxstatic}/vendor/ckeditor/samples/js/sample.js"></script>
	
	<%@include file="/common/adminJs.jspf"%>
	
<%-- 	<script type="text/javascript">
    $(function () {
        //比较简洁，细节可自行完善
        $('#uploadSubmit').click(function () {
            var data = new FormData($('#uploadForm')[0]);
            $.ajax({
                url: 'xxx/xxx',
                type: 'POST',
                data: data,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    console.log(data);
                    if(data.status){
                        console.log('upload success');
                    }else{
                        console.log(data.message);
                    }
                },
                error: function (data) {
                    console.log(data.status);
                }
            });
        });

    })
	</script>  --%>
	
	<script>
	initSample(); //初始化ckeditor
	
	function save() {
		//alert($('#itemCategoryDetail_id').val());
		var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/; // 价格正则
		if($('#name').val().length <= 0){
			layer.msg("名称不能为空");
			//alert("名称不能为空");
		}else if(!reg.test($('#price').val())){
			layer.msg("价格格式有误");
			//alert("价格格式有误");
		}else if($('#stock').val().length <= 0){
			layer.msg("库存不能为空");
			//alert("库存不能为空");
		}/* else if($('#itemCategoryDetail_id').val() ==  null){
			//layer.msg("请选择分类");
			alert("请选择分类");
		} */else{
			$('#intro').val(CKEDITOR.instances.editor.getData());
			//alert($('#intro').val());
			var data = new FormData($('#form')[0]);
	        $.ajax({
	            type: 'POST',
	            url: '${ctx}/admin/item/save',
	            data: data,
	            //data: $('#form').serialize(),
	            dataType: 'json',
	            async: false,
	            cache: false,
	            contentType: false,
	            processData: false,
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
			               		      	location.href='${ctx}/admin/item/list';
			               		      }
			             		)
	                }
	            },
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	            	//alert(XMLHttpRequest.status);
           		 	//alert(XMLHttpRequest.readyState);
           		 	//alert(textStatus);
	            	if(XMLHttpRequest.status == '413'){
	            		layer.msg("图片总大小超过限制");
	            	}else{
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
			               		      	location.href='${ctx}/admin/item/list';
			               		      }
		           		    ) 
	            	}
	            }
	        });
		}
    }

	</script>
</body>

</html>
