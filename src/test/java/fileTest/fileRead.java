package fileTest;

import static org.junit.Assert.*;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.swing.text.AbstractDocument.Content;

import org.junit.Before;
import org.junit.Test;

public class fileRead {
	File file;
	String content = "";

	@Before
	public void before() {
		file = new File("F:/MyBlog/justTest.txt");
	}

	@Test
	public void test() throws IOException {
		try {
//			FileReader fileReader = new FileReader(file);
			FileInputStream inputStream = new FileInputStream(file);
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "GBK");
			BufferedReader reader = new BufferedReader(inputStreamReader);
			String line = null;
			while ((line = reader.readLine()) != null) {
				content+=line;
				content+="\n";
			}
			System.out.println(content);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
