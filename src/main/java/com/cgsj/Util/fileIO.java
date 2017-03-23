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
		br.close();
		streamReader.close();
		inputStream.close();
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
			System.out.println("创建文件夹"+newfile.mkdir());
		}
		File newtext = new File("F:/MyBlog/" + articleType + "/" + articleId + ".md");
		if (!newtext.exists()) {
			System.out.println(newtext.getAbsolutePath());
			newtext.createNewFile();
			System.out.println("创建文件成功！！！！！！！");
		}
		FileOutputStream outputStream = new FileOutputStream(newtext);
		OutputStreamWriter streamWriter = new OutputStreamWriter(outputStream, "GBK");
		StringReader stringReader = new StringReader(textContent);
		while ((hasread = stringReader.read(buffer)) > 0) {
			appendString = new String(buffer, 0, hasread);
			System.out.println(appendString);
			streamWriter.write(appendString);
		}
		stringReader.close();
		streamWriter.close();
		outputStream.close();
		return 1;
	}

	// 删除保存在服务器的文件
	public int deleteFile(String articleType, int articleId) throws IOException {
		File newfile = new File("F:/MyBlog/" + articleType);
		File newtext;
		// 删除出已有文件
		if (newfile.exists()) {
			newtext = new File("F:/MyBlog/" + articleType + "/" + articleId + ".md");
			if (newtext.exists()) {
				newtext.delete();
			}
		}
		return 1;
	}

	// 更改文章的分类
	public int changeFile(String lastType, String articleType, int articleId) throws IOException {
		File newfile = new File("F:/MyBlog/" + lastType);
		File newtext;
		String textContent = "";
		fileIO fileIO = new fileIO();
		// 删除出已有文件
		if (newfile.exists()) {
			newtext = new File("F:/MyBlog/" + lastType + "/" + articleId + ".md");
			if (newtext.exists()) {
				textContent = fileIO.fileRead(newtext);
				System.out.println("文件是否删除成功" + newtext.delete());
			}
		}
		fileIO.fileWrite(textContent, articleType, articleId);
		return 1;
	}

}
