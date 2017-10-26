<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<title>전송 결과</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String savePath = "/fileUpload/upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		ServletContext context = getServletContext();
		String uploadFilePath =context.getRealPath(savePath);
		System.out.println(uploadFilePath);
		System.out.println("잘됨");
		try{
			System.out.println("들어옴");
			System.out.println(request);
			System.out.println(uploadFilePath);
			System.out.println(uploadFileSizeLimit);
			System.out.println(encType);
			System.out.println(new DefaultFileRenamePolicy());
			
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,new DefaultFileRenamePolicy());
			System.out.println("잘됨2");
			
			Enumeration files = multi.getFileNames();
			
			
			while(files.hasMoreElements()){
				String file = (String) files.nextElement();
				String file_name = multi.getFilesystemName(file);
				String ori_file_name = multi.getOriginalFileName(file);
				out.println("<br>업로드된 파일명 :" + file_name);
				out.println("<br>원본 파일명 :" + ori_file_name);
				out.println("<hr>");
				
				
				
			}
		}catch(Exception e){
			System.out.println("예외발생try 문 : "+e);
			e.printStackTrace();
			//System.out.println("예외 발생 : " + e);
			} //catch
		
		
		
	%>

</body>
</html>