package com.playus.clim.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playus.clim.util.SnapshotCreateUtil;


@Controller
public class SnapshotController {
	
	@Autowired
	private SnapshotCreateUtil createUtil;
	
	@RequestMapping(value="/snapshot",
			method=RequestMethod.GET)
	public void snapshot() {
		
	}
	

	@RequestMapping(value="/ajax/snapshot",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getSnapasdfasf(Long time,
			String fileName, 
			HttpServletRequest request) 
	throws Exception{
		
		ServletContext context =
				request.getServletContext();
		
		//영화가 있는 폴더 경로
		String moviePath = 
				context.getRealPath("movie");
		//스냅샷 찍을 폴더 경로
		String snapshotPath = 
				context.getRealPath("snapshot");
		

		

		
		String inputFilename = 
				moviePath+File.separator+fileName;
		
		long timestamp = Long.valueOf(time*1000);
		
		File outputDir = new File(snapshotPath);
		String snapshotPrefix = fileName;
		int maxHeight = 600;
		int maxWidth = 1024;
		
		//이전의 스냅샷 지우기
		File[] snapshots = outputDir.listFiles();
		
 		for(File snapshot  : snapshots) {
 			snapshot.delete();
 		}//for end
 		
		createUtil.makeSnapshots(inputFilename,
				timestamp, outputDir,
				snapshotPrefix,
				maxWidth, maxHeight);
		
		
		return "{\"src\":\""+fileName+timestamp+".jpg\"}";
	}

}








