package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

@WebServlet("/UploadServlet")
public class UploadServlet extends BaseServlet {
	/**
	 * 餐品图片上传
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 创建一个DiskFileItemfactory工厂类
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 创建一个ServletFileUpload核心对象
		ServletFileUpload sfu = new ServletFileUpload(factory);
		// 解决上传文件名中文乱码
		sfu.setHeaderEncoding("utf-8");

		String filename = "";
		// 解析request对象
		try {
			FileItem fileItem = sfu.parseRequest(request).get(0);
			filename = uploadFile(fileItem);
			response.getWriter().print(filename);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().print("");
		}

	}
	// 将上传文件表单项封装
	private String uploadFile(FileItem fileItem) {
		// 如果上传表单项
		// 得到文件输入流
		// 创建物理目录路径
		String realPath = this.getServletContext().getRealPath("/upload");
		// 根据该路径创建一个目录对象
		File dir = new File(realPath);
		if (!dir.exists()) {
			dir.mkdirs();// 创建一个指定的目录
		}
		// 得到上传的名子
		String filename = fileItem.getName();
		if (filename != null) {
			// 得到文件后缀
			String extend = filename.substring(filename.indexOf("."));
			// 重写生成一个唯一的文件名
			filename = System.currentTimeMillis() + extend;
		}
		// 上传文件,自动删除临时文件
		try {
			fileItem.write(new File(realPath, "/" + filename));
		} catch (Exception e) {
			filename = "";
		}

		return filename;
	}
}