package kr.or.ddit.member.view;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class ProfileImgView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		String filepath = (String) model.get("filepath"); // 파일경로
		if(filepath != null) {
			FileInputStream fis = new FileInputStream(filepath);
			ServletOutputStream sos = response.getOutputStream();
			
			byte[] buffer = new byte[512];
			while(fis.read(buffer) != -1) {
				sos.write(buffer);
			}
			
			fis.close();
			sos.flush(); // 혹시 응답이 안간것이 있으면 마지막으로 보내라
			sos.close();
		}
	}
	
}
