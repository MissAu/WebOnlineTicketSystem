<%@ page language="java" import="java.sql.*" errorPage="errorpage.jsp" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="cs" />
    <meta name="author" lang="cs" content="..." />
    <meta name="copyright" lang="cs" content="..." />
    <meta name="description" content="..." />
    <meta name="keywords" content="..." />
    <meta name="robots" content="all,follow" />
    <link href="css/screen.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <!--[if lte IE 6]>
    <link href="css/msie.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <![endif]-->
    <link rel="stylesheet" media="print" type="text/css" href="css/print.css" />

    <title>火车售票 &ndash;  </title>


	
	
  </head>
<jsp:useBean id="sta_sta" scope="page" class="bean.sta_sta"/>   
  <body>

    <div id="layout">
      
      <div id="header">
        
        <h1 id="logo"><a href="./" title="Company">火车<span class="light">售票</span><span class="leaf">&nbsp;</span></a></h1>
        <hr class="noscreen" />   
     
        <p class="noscreen noprint">
          <em>Skip to <a href="#obsah">content</a>, <a href="#nav">navigation</a>.</em>
        </p>
      
      <hr class="noscreen" />
      
      <div id="nav" class="box">
      
        <hr class="noscreen" />
      </div> 
        
      <div id="container" class="box">
      
        <div id="obsah" class="content box">
          <div class="in">
          
                    
            <h2>站站管理</h2>
          <h3>  <a href="addsta_sta.jsp">新增站站信息</a></h3>
            <p>
<%
String admin_id = (String)session.getId(); 
if(admin_id==null){response.sendRedirect("hello.jsp");}
String stationid1="",stationid2="",stationname1="",stationname2="";
double price,distance;


		 
		 
		 
  ResultSet rs = sta_sta.getSta_sta1();
  
   
rs.last();
  
  
   int pageSize=8;
int Page=1;
int  totalPage=1;
int totalrecord=0;


totalrecord=rs.getRow();
if(totalrecord==0){%>
<p>
没有你要查询的信息
</p>
<%}
else{
if(totalrecord%pageSize==0)
totalPage=totalrecord/pageSize;
else
totalPage=(int)(totalrecord/pageSize)+1;

if(totalPage==0) totalPage=1;
if(request.getParameter("Page")==null||request.getParameter("Page").equals(""))
{Page=1;}
else
try{
Page=Integer.parseInt(request.getParameter("Page"));
}
catch(java.lang.NumberFormatException e)
{Page=1;}
if(Page<1)Page=1;
if(Page>totalPage)Page=totalPage;
 rs = sta_sta.getSta_sta1();
rs.absolute((Page-1)*pageSize+1); 
  %>

  <table width="100"  border="0" >

    <tr>
      <td>车站1</td>
	<td>车站2</td>
	 <td>距离</td>
		<td>总价</td>
		<td>删除</td>
		<td>更新</td>
         </tr>
		 <%
 for(int iPage=1;iPage<=pageSize;iPage++) 
 {
        
 stationid1=rs.getString("station_id1");
 stationid2=rs.getString("station_id2");
 distance=rs.getDouble("distance");
 price=rs.getDouble("total_price");
  %>
      <tr> 
        <td><%=stationid1%></td>
        <td><%=stationid2%></td>
        <td><%=distance%><br></td>
	    <td><%=price%></td>
        <td><a href="sta_stasvlt?action=delete&stationid1=<%=stationid1%>&stationid2=<%=stationid2%>">删除</a></td>
        <td><a href="updatesta_sta.jsp?action=update&stationid1=<%=stationid1%>&stationid2=<%=stationid2 %> ">更新</a> </td>
      </tr>

      <% if(!rs.next())
		  break; 
  }
  %> 
		 
		 
  </table>

    <form action="sta_sta.jsp" method="get">
<%
if(Page!=1)
{out.print(" <a href=sta_sta.jsp?Page=1>第一页</a>");
out.print(" <a href=sta_sta.jspPage="+(Page-1)+">上一页</a>");
}
if(Page!=totalPage)
{
out.print(" <a href=sta_sta.jsp?Page="+(Page+1)+">下一页</a>");
out.print(" <a href=sta_sta.jsp?Page="+totalPage+">最后一页</a>");
}
%>

输入页数：<input type="text" name="Page" size="3"/>页数：<%=Page%>/<%=totalPage%>
<%}
 %></form>




	
		
			

			
			
			
            
         
           
            
            
         
    
        
            
           
            
          </div>
        </div>

        <div id="panel-left" class="box panel">
          <div class="in">
 <table width="150" border="0" cellspacing="0" cellpadding="0"  >
    
	<tr><td>
		
	<table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
              <td height="25"> 
                  <div align="center"><b><a href="changeadminpass.jsp">修改密码</a></b></div>
                </td>
              </tr>
            </table>
		
		
<table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
                <td> 
                  <div align="center"><b>
<a href="userinfo.jsp">
<!--Button1-->用户信息</a></b></div>
                </td>
              </tr>
</table>

     <table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
                <td> 
                  <div align="center"><b>
<a href="orderinfo.jsp">
订票信息</a></b></div>
                </td>
              </tr>
            </table>
          
          
            <table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
                <td> 
                  <div align="center"><b>
<a href="traininfo.jsp">
车次信息</a></b></div>
                </td>
              </tr>
            </table>
           
           
            <table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
                <td> 
                  <div align="center"><b>
<a href="type.jsp">
<!--Button1-->火车类型</a></b></div>
                </td>
              </tr>
            </table>
           
           
            <table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
                <td> 
                  <div align="center"><b>
<a href="station.jsp">
<!--Button1-->站点管理</a></b></div>
                </td>
              </tr>
            </table>
          
          
            <table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
                <td> 
                  <div align="center"><b>

<a href="sta_sta.jsp">
<!--Button1-->站站管理</a> </b></div>
                </td>
              </tr>
            </table>   
        
       
            <table width="120" border="0" cellspacing="0" cellpadding="0" height="20"   >
              <tr> 
                <td> <div align="center"><b> 
<a href="logincheck?action=logout"> 
退出登录</a> </b></div></td>
              </tr>
            </table>
</td></tr>
      </table>


          </div>
        </div>
      
      </div>
        
        <div id="footer">
          <span class="f-left">  <a href="/"> </a></span> <span class="f-right">  <a href="http://www.davidkohout.cz"> </a>  <a href="http://www.efektim.com" title="Efektim - Real Estate Consulting"> </a></span>
        </div>
    </div></div>
  </body>
</html>





