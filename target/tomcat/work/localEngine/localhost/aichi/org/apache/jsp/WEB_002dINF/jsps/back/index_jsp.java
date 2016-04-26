package org.apache.jsp.WEB_002dINF.jsps.back;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write(' ');

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">   \r\n");
      out.write("<meta name=\"layout\" content=\"main\"/>\r\n");
      out.write("<script src=\"");
      out.print( basePath);
      out.write("resources/js/jquery.min.js\" type=\"text/javascript\" ></script>\r\n");
      out.write("<script src=\"");
      out.print( basePath);
      out.write("resources/js/bootstrap.min.js\" type=\"text/javascript\" ></script>\r\n");
      out.write("<script src=\"");
      out.print( basePath);
      out.write("resources/js/pagination.js\" type=\"text/javascript\" ></script>\r\n");
      out.write("<link href=\"");
      out.print( basePath);
      out.write("resources/css/customize-template.css\" type=\"text/css\" media=\"screen, projection\" rel=\"stylesheet\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"search();\">\r\n");
      out.write(" <div class=\"navbar navbar-fixed-top\">\r\n");
      out.write("            <div class=\"navbar-inner\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <button class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\"#app-nav-top-bar\">\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <a href=\"#\" class=\"brand\"><i class=\"icon-leaf\">10004</i></a>\r\n");
      out.write("                    <div id=\"app-nav-top-bar\" class=\"nav-collapse\">\r\n");
      out.write("\r\n");
      out.write("                        <ul class=\"nav pull-right\">\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"loiginOut\">Admin</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write(" <div id=\"body-container\">\r\n");
      out.write("     <div id=\"body-content\">\r\n");
      out.write("        <section class=\"page container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"span4\">\r\n");
      out.write("                    <div class=\"blockoff-right\">\r\n");
      out.write("                        <ul id=\"person-list\" class=\"nav nav-list\">\r\n");
      out.write("                            <li class=\"nav-header\">菜单</li>\r\n");
      out.write("                            \r\n");
      out.write("                            <li class=\"active\">\r\n");
      out.write("                                <a href=\"javascript:search();\">\r\n");
      out.write("                                    <i class=\"icon-chevron-right pull-right\"\"></i>\r\n");
      out.write("                                \t\t  Customer管理\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        \r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"FilmIndex.jsp\">\r\n");
      out.write("                                    <i class=\"icon-chevron-right pull-right\"></i>\r\n");
      out.write("                                \t\tFilm设置\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("    \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"span12\">\r\n");
      out.write("                \r\n");
      out.write("                    <div id=\"customer\" class=\"box\">\r\n");
      out.write("                        <div class=\"box-header\">\r\n");
      out.write("                            <i class=\"icon-user icon-large\"></i>\r\n");
      out.write("                            <h5>客户列表</h5>\r\n");
      out.write("                              <a class=\"btn btn-info\" href=\"newCustomer.jsp\" style=\"margin-left:100px\">新建</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                       \r\n");
      out.write("                        <div class=\"box-content box-table\">\r\n");
      out.write("                        <table class=\"table table-hover tablesorter\" id=\"table\">\r\n");
      out.write("                          \t<thead id=\"tem\">\r\n");
      out.write("               \t\t\t\t\t<th id=\"handle\" width=\"30%\">操作</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th id=\"firstName\" width=\"5%\">FirstName</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th id=\"lastName\" width=\"5%\">LastName</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th id=\"address\" width=\"15%\">Address</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th id=\"email\" width=\"15%\">Email</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th id=\"customerId\" width=\"15%\">CustomerId</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th id=\"lastUpdate\" width=\"15%\">LastUpdate</th>\r\n");
      out.write("\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("                        </table>\r\n");
      out.write("                        \r\n");
      out.write("                        <div id=\"bottomTool\" class=\"row-fluid\"> \r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"span6\" style=\"width: 25%;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div id=\"DataTables_Table_0_info\" class=\"dataTables_info\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t<!-- 第2页 -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"span6\" style=\"width: 30%;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"dataTables_paginate paging_bootstrap pagination\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<ul id=\"previousNext\" style=\"float: right\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<li onclick=\"previous()\" class=\"prev disabled\"><a\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tid=\"previousPage\" href=\"#\">← 上一页</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div id=\"page\" style=\"float: left;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<select id=\"pageNum\" onchange=\"search()\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"width: 50PX; margin-right: 1px;\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\taria-controls=\"DataTables_Table_0\" size=\"1\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tname=\"DataTables_Table_0_length\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<option selected=\"selected\" value=\"1\">1</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<li class=\"next\" onclick=\"next()\"><a id=\"nextPage\" href=\"#\">下一页→ </a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("        \r\n");
      out.write("    \r\n");
      out.write("      </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("        <div id=\"spinner\" class=\"spinner\" style=\"display:none;\">\r\n");
      out.write("            Loading&hellip;\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <footer class=\"application-footer\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <p>Application Footer</p>\r\n");
      out.write("                <div class=\"disclaimer\">\r\n");
      out.write("                    <p>This is an example disclaimer. All right reserved.</p>\r\n");
      out.write("                    <p>Copyright © keaplogik 2011-2012</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </footer>\r\n");
      out.write("        \r\n");
      out.write("   <!--                 -----------111111111111111111--------------------------------------------- -->\r\n");
      out.write("   \r\n");
      out.write("   \t<div class=\"modal fade\" id=\"edit\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("\t    <div class=\"modal-dialog\">\r\n");
      out.write("\t        <div class=\"modal-content\">\r\n");
      out.write("\t            <div class=\"modal-header\">\r\n");
      out.write("\t                <button type=\"button\" class=\"close\"\r\n");
      out.write("\t                        data-dismiss=\"modal\" aria-hidden=\"true\">\r\n");
      out.write("\t                    &times;\r\n");
      out.write("\t                </button>\r\n");
      out.write("\t                <h4 class=\"modal-title\" id=\"myModalLabel\">\r\n");
      out.write("\t                    Customer编辑框\r\n");
      out.write("\t                </h4>\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t            <div class=\"modal-body\">\r\n");
      out.write("\t\t\t \t\t<form style=\"margin-left:180px;\">\r\n");
      out.write("\t\t\t \t\t\tFirstname:<input type =\"text\" name = \"fistname\"><br/>\r\n");
      out.write("\t\t\t \t\t\tLastname:<input type = \"text\" name = \"lastname\"> <br/>\r\n");
      out.write("\t\t\t \t\t\tAddress:           \r\n");
      out.write("\t\t\t\t\t\t   <select>\r\n");
      out.write("\t\t\t\t\t\t\t  <option value =\"47 MySakila Drive\">47 MySakila Drive</option>\r\n");
      out.write("\t\t\t\t\t\t\t  <option value =\"28 MySQL Boulevard\">28 MySQL Boulevard</option>\r\n");
      out.write("\t\t\t\t\t\t\t  <option value=\"23 Workhaven Lane\">23 Workhaven Lane</option>\r\n");
      out.write("\t\t\t\t\t\t\t  <option value=\"1913 Hanoi Way\">1913 Hanoi Way</option>\r\n");
      out.write("\t\t\t\t\t\t\t  <option value=\"1121 Loja Avenue\">1121 Loja Avenue</option>\r\n");
      out.write("\t\t\t\t\t\t\t  <option value=\"692 Joliet Street\">692 Joliet Street</option>    \r\n");
      out.write("\t\t\t\t\t\t\t</select><br/>\r\n");
      out.write("\t\t\t \t\t\tEmail:<input type = \"text\" name = \"email\"> <br/>\r\n");
      out.write("\t\t\t \t\t\tCustomerId:<input type = \"text\" name = \"customerId\"> <br/>\r\n");
      out.write("\t\t\t \t\t\tLastUpdate:<input type = \"text\" name = \"lastUpdate\"> <br/>\r\n");
      out.write("\t\t\t \t\t</form>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t            <div class=\"modal-footer\">\r\n");
      out.write("\t                <button type=\"button\" class=\"btn btn-default\"\r\n");
      out.write("\t                        data-dismiss=\"modal\">关闭\r\n");
      out.write("\t                </button>\r\n");
      out.write("\t                <button type=\"button\" class=\"btn btn-primary\">\r\n");
      out.write("\t                \t\t    提交更改\r\n");
      out.write("\t                </button>\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t        </div><!-- /.modal-content -->\r\n");
      out.write("\t    </div><!-- /.modal -->\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"modal fade\" id=\"delete\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("\t    <div class=\"modal-dialog\">\r\n");
      out.write("\t        <div class=\"modal-content\">\r\n");
      out.write("\t            <div class=\"modal-header\">\r\n");
      out.write("\t                <button type=\"button\" class=\"close\"\r\n");
      out.write("\t                        data-dismiss=\"modal\" aria-hidden=\"true\">\r\n");
      out.write("\t                    &times;\r\n");
      out.write("\t                </button>\r\n");
      out.write("\t                <h4 class=\"modal-title\" id=\"myModalLabel\">\r\n");
      out.write("\t                    Customer编辑框\r\n");
      out.write("\t                </h4>\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t            <div class=\"modal-body\">\r\n");
      out.write("\t\t\t \t\t是否确定删除该Customer信息？\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t            <div class=\"modal-footer\">\r\n");
      out.write("\t                <button type=\"button\" class=\"btn btn-default\"\r\n");
      out.write("\t                        data-dismiss=\"modal\">关闭\r\n");
      out.write("\t                </button>\r\n");
      out.write("\t                <button type=\"button\"  id=\"dodel\" class=\"btn btn-primary\" onclick=\"del()\">\r\n");
      out.write("\t                \t\t    确定\r\n");
      out.write("\t                </button>\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t        </div><!-- /.modal-content -->\r\n");
      out.write("\t    </div><!-- /.modal -->\r\n");
      out.write("\t</div>\r\n");
      out.write("   \r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
