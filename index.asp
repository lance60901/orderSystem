<%@language="vbscript" codepage=950 %>
<!--#include file="conn_nection.asp"-->
<!--#include file="str.asp"-->

<%

web_pm = request.querystring("pm")

if web_pm = "1" then
Response.Cookies("user_pm")="1"
end if

if Request.Cookies("user_pm") <> "1" then
dim u,b,v
set u=Request.ServerVariables("HTTP_USER_AGENT")
set b=new RegExp
set v=new RegExp
b.Pattern="android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|meego.+mobile|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino"
v.Pattern="1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-"
b.IgnoreCase=true
v.IgnoreCase=true
b.Global=true
v.Global=true
'if b.test(u) or v.test(Left(u,4)) then
'response.redirect "http://www.a-wei.com.tw/mobil/index.asp"
'end if
end if
%>
<%
action = request.querystring("action")

'if instr(request.ServerVariables("HTTP_USER_AGENT"),"AppleWebKit")>0 then
'    response.redirect  "mobil/index.asp" 
'    response.end
'else
'    response.redirect  "index.asp" 
'    response.end 
'end if

if Request.Cookies("user_acount") <> "" then
show_name = Request.Cookies("user_name")
show_with = "660"
else
show_with = "240"
end if

sql="select * from web_information where id = 1 "
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,0,1
	
	if not rs.eof then
	web_title = strs(rs("web_title"))
	web_keyword = strs(rs("web_keyword"))
	web_description = strs(rs("web_description"))
	end if
	rs.close
	set rs=nothing
	
	
	sql="select * from s_banner order by news_top asc, id desc "
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,0,1
	pic_i = 0
	
	if rs.eof then
	show_chk = 1
	else
	show1_pic = "admin/s_banner/user_path/"&rs("pic_name")
	end if
	
	'<a href="javascript:go()"></a> 這是小廣告的連結語法，要使用時請加到第 148行 置換為： <a href="javascript:go()"><img src="icon1.gif" name="imgs"></a>


%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb='http://www.facebook.com/2008/fbml'><head>
<meta http-equiv="Content-Language" content="zh-tw">
<title><%=web_title%></title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<STYLE> 
   <!-- A{text-decoration:none} --> 
</STYLE>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<meta name="keywords" content="<%=web_keyword%>">
<meta name="description" content="<%=web_description%>">
<style type="text/css">
<!--
#st {
	position: absolute;
	z-index:99;  /**/
	width:187px;
}
#version {
	font-size: 12px;
	color: #333333;
	text-align: center;
	width:100%;
}
-->
.button {
   border-top: 1px solid #050505;
   background: #828b91;
   background: -webkit-gradient(linear, left top, left bottom, from(#0f0f0f), to(#828b91));
   background: -webkit-linear-gradient(top, #0f0f0f, #828b91);
   background: -moz-linear-gradient(top, #0f0f0f, #828b91);
   background: -ms-linear-gradient(top, #0f0f0f, #828b91);
   background: -o-linear-gradient(top, #0f0f0f, #828b91);
   padding: 2px 4px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   color: white;
   font-size: 11px;
   font-family: Helvetica, Arial, Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   cursor: pointer;
   }
   body {
		background-color: rgb(107, 167, 29);
   }
</style>
<SCRIPT Language="JavaScript">
var speed = 3000  //圖片切換時間
var img= new Array()
var url= new Array()
var current = 0

//一張圖片對應一個網址,可無限增加,編號由0開始
<%do while not rs.eof%>
img[<%=pic_i%>] = new Image(); img[<%=pic_i%>].src = "admin/s_banner/user_path/<%=rs("pic_name")%>"; url[<%=pic_i%>] = "http://www.a-wei.com.tw/index.asp" 
<%
pic_i = pic_i + 1
if rs.eof then exit do
rs.movenext
loop
rs.close
set rs=nothing%>

function start() 
{
current++
if(current >=img.length) current = 0
document.imgs.src = img[current].src
setTimeout("start()",speed);
}

function go() 
{window.open(url[current])}
//-->
</SCRIPT>
<script>
function playswf_tra(sFile,sWidth,sHeight){
		document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ sWidth +'" height="'+ sHeight +'">  ');
		document.write('<param name="movie" value="'+ sFile +'">');
		document.write('<param name="quality" value="high">');
		document.write('<param name="bgcolor" value="#000000" />');
//		document.write('<param name="SCALE" value="noborder" />');
		document.write('<param name="menu" value="false" />');
		document.write('<param name="wmode" value="transparent">'); //opaque transparent
		document.write('<embed src="'+ sFile +'" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="'+ sWidth +'" height="'+ sHeight +'"></embed>  ');
		document.write('</object>');
	}
</script>
<script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    window.onload = fackbooklike;
    function fackbooklike() {
        var fbLike = document.getElementById("fbLike");
        if (fbLike)
        {
            document.getElementById("fbLike").src = "http://www.facebook.com/plugins/like.php?href=" + location.href + "&layout=standard&show_faces=true&width=450&action=like&colorscheme=light&height=35";
        }
    }
</script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
</head>
<body bgcolor="#6BA71D" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" rightmargin="0" bottommargin="0" onLoad="setTimeout('start()',speed);">
<div align="center">
<table id="___01" width="1024" height="1607" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="1024" height="55" bgcolor="#FFFFFF" align="left" valign="top">
			<table border="0" width="1024" cellpadding="0" style="border-collapse: collapse" height="55">
				<tr>
					<td width="294" height="100" align="left" valign="bottom">
					<p style="margin-left: 10px"><a href="index.asp">
					<img border="0" src="logo.gif" width="265" height="93" border=0></a></td>
					<td width="730" align="left" valign="top">
					<table border="0" width="730" cellpadding="0" style="border-collapse: collapse" height="98">
						<tr>
							<td height="102" width="615">
							<%if show_chk <> 1 then%>
							<img src="<%=show1_pic%>" name="imgs"><%end if%></td>
							<td height="102" width="115" align="center">
							<%if Request.Cookies("user_acount") <> "" then%>
							<table border="0" width="128" cellpadding="0" style="border-collapse: collapse" height="102">
								<tr>
									<td height="20" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="logout.asp" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">會員登出</font></a></font></td>
								</tr>
								<tr>
									<td height="20" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font color="#FFFFFF" size="2"><b><%=show_name%>  歡迎登入!</b></font></td>
								</tr>
								<tr>
									<td height="20" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=15" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">會員專區</font></a></font></td>
								</tr>
								<tr>
									<td height="21" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=11&id=7" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">招募人才</font></a></font></td>
								</tr>
								<tr>
									<td height="21" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=11&id=20" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">書店介紹</font></a></font></td>
								</tr>
								</table>
							<%else%>
							<table border="0" width="127" cellpadding="0" style="border-collapse: collapse" height="102">
								<tr>
									<td height="20" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=5" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">會員登入</font></a></font></td>
								</tr>
								<tr>
									<td height="20" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=2" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">加入會員</font></a></font></td>
								</tr>
								<tr>
									<td height="20" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=15" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">會員專區</font></a></font></td>
								</tr>
								<tr>
									<td height="21" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=11&id=7" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">招募人才</font></a></font></td>
								</tr>
								<tr>
									<td height="21" align="center" style="border-bottom: 1px solid #FFFFFF" bgcolor="#00DBDB">
									<font size="2" color="#808080">
									<a href="sub_index.asp?action=11&id=20" style="text-decoration: none; font-weight:700">
									<font color="#FFFFFF">書店介紹</font></a></font></td>
								</tr>
								</table>
							<%end if%>
							</td>
						</tr>
						</table>
					</td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td width="1024" height="33" bgcolor="#FFFFFF" align="left" valign="top">
		<!--#include file="menu.asp"--></td>
	</tr>
	<tr>
		<td width="1024" height="32" bgcolor="#FFFFFF" align="left" valign="top">
		<!--#include file="top2.asp"--></td>
	</tr>
	<tr>
		<td width="1024" height="200" bgcolor="#FFFFFF" align="left" valign="top">
		<!--#include file="top3.asp"--></td>
	</tr>
	<tr>
		<td width="1024" height="100" bgcolor="#FFFFFF" align="left" valign="top">
		<!--#include file="top5_d1.asp"--></td>
	</tr>
	<tr>
		<td width="1024" height="512" align="left" valign="top" bgcolor="#FFFFFF">
		<!--#include file="top4.asp"--></td>
	</tr>

	<tr>
		<td width="1024" height="254" bgcolor="#FFFFFF" align="left" valign="top">
		<!--#include file="top6.asp"--></td>
	</tr>
	<tr>
		<td width="1024" height="109" bgcolor="#FFFFFF" align="left" valign="top">
		<!--#include file="top7.asp"--></td>
	</tr>
</table>
</div>
<a id="buycartImg" href="sub_index.asp?action=7"><img src="./buycart.png" /><br /><span>購&nbsp;物&nbsp;車</span></a>
</body>
<style>
.ui-widget-header {
	color: white;
	font-family: 新細明體;
	background: #9dd53a; /* Old browsers */
	background: -moz-linear-gradient(top, #9dd53a 0%, #a1d54f 50%, #7cbc0a 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#9dd53a), color-stop(50%,#a1d54f), color-stop(100%,#7cbc0a)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #9dd53a 0%,#a1d54f 50%,#7cbc0a 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #9dd53a 0%,#a1d54f 50%,#7cbc0a 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #9dd53a 0%,#a1d54f 50%,#7cbc0a 100%); /* IE10+ */
	background: linear-gradient(to bottom, #9dd53a 0%,#a1d54f 50%,#7cbc0a 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#9dd53a', endColorstr='#7cbc0a',GradientType=0 ); /* IE6-9 */
}
#dialog-search {
	font-family: 微軟正黑體;
}
.mark {
	font-size: 8;
	color: #a6a6a6;
}
#buycartImg {
	width: 60px;
	position: fixed;
	top: 100px;
	right: 30px;
	line-height: 25px;
	color: white;
}
#buycartImg span {
	background-color: #008CCE;
	padding: 2px;
	border-radius: 5px;
}
#buycartImg:hover {
	color: red;
}
</style>
<%
Set rs_sub = Server.CreateObject("ADODB.Recordset")
				
					sql="select sub_menu,id from sub_menu order by news_top asc, id asc "
				    rs_sub.open sql,conn,1,1
%>
<div id="dialog-search" title="進 階 查 詢">
<form id="dialog_form" method="POST" action="sub_index.asp?action=66">
	<label>書名: &nbsp;&nbsp;&nbsp;<input type="text" name="namekey" placeholder="可以輸入部分書名"/></label><br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mark" >ex. 電機機械實習(修訂版) 輸入 '電機'</span><br />
	<label>作者: &nbsp;&nbsp;&nbsp;<input type="text" name="author" placeholder="可以輸入部分作者名字"/></label><br /><br />
	<label>分類: &nbsp;&nbsp;&nbsp;<select name="sub_menu" ><option value="">無</option>
		<%
			do while not rs_sub.eof
			%>
				<option value="<%=rs_sub("id")%>"><%=strs(rs_sub("sub_menu"))%></option>
			<%
			if rs_sub.eof then exit do
			rs_sub.movenext
			loop
			rs_sub.close
			set rs_sub=nothing
			%>
	</select></label><br /><br />
	<label>出版社: <input type="text" name="publisher" placeholder="可以輸入部分出版社名稱"/></label><br /><br />
</form>
</div>
<script type="text/javascript">
	$( "#search-link" ).click(function( event ) {
		event.preventDefault();
		$( "#dialog-search" ).dialog( "open" );
		
	});
	$( "#dialog-search" ).dialog({
		autoOpen: false,
		width: 400,
		modal: true,
		position: { my: "center", at: "top", of: window },
		buttons: [
			{
				text: "查詢",
				click: function() {
					dialog_form.submit();
				}
			},
			{
				text: "取消",
				click: function() {
					$( this ).dialog( "close" );
				}
			}
		]
	});
</script>
</html>