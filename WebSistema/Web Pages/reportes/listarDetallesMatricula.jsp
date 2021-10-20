<%-- 
    Document   : ListarDetallesMatricula
    Created on : 20-oct-2021, 9:52:43
    Author     : nikol
--%>

<%@ page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@ page import="modelos.Conexion" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
 Conexion con = new Conexion();
 String accion = request.getParameter("accion");
 
if (accion.compareTo ("MOSTRAR") == 0) {
    File reportFile = new File(application.getRealPath( 
                                 "/reportes/listarMatricula.jasper"));
    Map parameters = new HashMap();
    //-------------------------------------------
    String nro_doc=request.getParameter("nro_doc");
    parameters.put("p_nro_doc", nro_doc);

    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),
                      parameters, con.Conectar());
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    ouputStream.flush();
    ouputStream.close();
 }
%>
