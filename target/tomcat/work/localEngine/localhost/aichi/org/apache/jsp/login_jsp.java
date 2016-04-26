package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>登录</title>\r\n");
      out.write("</head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(basePath );
      out.write("resources/css/bootstrap.min.css\">\r\n");
      out.write("<link href=\"");
      out.print( basePath);
      out.write("/resources/css/customize-template.css\" type=\"text/css\" media=\"screen, projection\" rel=\"stylesheet\" />\r\n");
      out.write("<style>\r\n");
      out.write("    body{\r\n");
      out.write("    \tbackground:");
      out.print( basePath);
      out.write("resources/images/12.jpg;\r\n");
      out.write("    }\r\n");
      out.write("\tform{\r\n");
      out.write("\t\tmargin-top:150px;\r\n");
      out.write("\t\tborder:1px solid;\r\n");
      out.write("\t\twidth:500px;\r\n");
      out.write("\t\tmargin-left:400px;\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("<body>\r\n");
      out.write(" \t\t<div class=\"navbar navbar-fixed-top\">\r\n");
      out.write("            <div class=\"navbar-inner\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <button class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\"#app-nav-top-bar\">\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <a href=\"#\" class=\"brand\"><i class=\"icon-leaf\">aichi</i></a>\r\n");
      out.write("                    <div id=\"app-nav-top-bar\" class=\"nav-collapse\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\t\t<form class=\"form-horizontal\" role=\"form\" action=\"login\" method=\"post\">\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t\t<legend>\r\n");
      out.write("\t\t\t\t     <div class=\"form-group\">\r\n");
      out.write("\t\t            <label class=\"col-sm-4 control-label\">AiChi后台管理系统</label>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t\t\t\t</legend>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t        <div class=\"form-group\">\r\n");
      out.write("\t\t            <label class=\"col-sm-4 control-label\">用戶名：</label>\r\n");
      out.write("\t\t            <div class=\"col-sm-4\">\r\n");
      out.write("\t\t                <input type=\"text\" class=\"form-control\" placeholder=\"username\" name=\"masterName\">\r\n");
      out.write("\t\t            </div>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t\t        <div class=\"form-group\">\r\n");
      out.write("\t\t            <label class=\"col-sm-4 control-label\">密码：</label>\r\n");
      out.write("\t\t            <div class=\"col-sm-4\">\r\n");
      out.write("\t\t                <input type=\"password\" class=\"form-control\" placeholder=\"password\" name=\"password\">\r\n");
      out.write("\t\t            </div>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t        <div class=\"form-group\">\r\n");
      out.write("\t\t            <div class=\"col-sm-offset-4 col-sm-10\">\r\n");
      out.write("\t\t                <button type=\"submit\" class=\"btn btn-default\">登录</button>\r\n");
      out.write("\t\t            </div>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t\t    </form>\r\n");
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
