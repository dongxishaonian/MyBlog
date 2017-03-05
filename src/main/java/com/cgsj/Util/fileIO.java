package com.cgsj.Util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;

public class fileIO {

	// 读取相应温行内容
	public String fileRead(File file) throws IOException {
		FileInputStream inputStream = new FileInputStream(file);
		InputStreamReader streamReader = new InputStreamReader(inputStream, "GBK");
		BufferedReader br = new BufferedReader(streamReader);
		String text = null;
		String textContent = "";
		while ((text = br.readLine()) != null) {
			textContent += text;
			textContent += "\n";
		}
		System.out.println("此为文章内容" + textContent);
		return textContent;
	}

	// 保存文章在服务器
	public int fileWrite(String textContent, String articleType, int articleId) throws IOException {
		char[] buffer = new char[32];
		int hasread;
		String appendString = "";
		System.out.println("保存文章的内容为：" + textContent);
		File newfile = new File("F:/MyBlog/" + articleType);
		if (!newfile.exists()) {
			newfile.mkdir();
		}
		File newtext = new File("F:/MyBlog/" + articleType + "/" + articleId + ".txt");
		if(!newtext.exists()){
			newtext.createNewFile();
		}
		FileOutputStream outputStream = new FileOutputStream(newtext);
		OutputStreamWriter streamWriter = new OutputStreamWriter(outputStream, "GBK");
		StringReader stringReader = new StringReader(textContent);
		while ((hasread = stringReader.read(buffer)) > 0) {
			appendString = new String(buffer, 0, hasread);
			System.out.println(appendString);
			streamWriter.write(appendString);
		}
		streamWriter.close();
		return 1;
	}

}
