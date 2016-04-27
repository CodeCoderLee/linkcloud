package generator;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.TableConfiguration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class GeneratorTool {

	public static void mkController(String path,String Model,String model){
		File readfile = new File(path+"resources/ModelController.java.templ");
		//String path = readfile.getPath();//文件路径
		String absolutepath = readfile.getAbsolutePath();//文件的绝对路径
		//////// 开始挨个的读取文件  ////////
		BufferedReader bufReader;
		PrintWriter printWriter;
		try {
			bufReader = new BufferedReader(new InputStreamReader(new FileInputStream(absolutepath)));
			//数据流读取文件
			StringBuffer strBuffer = new StringBuffer();
			for (String temp = null; (temp = bufReader.readLine()) != null; temp = null) {
				if(temp.indexOf("${Model}") != -1 || temp.indexOf("${model}") != -1){ //判断当前行是否存在想要替换掉的字符 -1表示存在
					temp = temp.replace("${Model}", Model);
					temp = temp.replace("${model}", model);//替换为你想要的东东
				}
				strBuffer.append(temp);
				strBuffer.append(System.getProperty("line.separator"));//行与行之间的分割
			}
			
			printWriter = new PrintWriter(path+"java/cn/ac/bcc/controller/"+Model+"Controller.java");//替换后输出的文件位置（切记这里的E:/ttt 在你的本地必须有这个文件夹）
			printWriter.write(strBuffer.toString().toCharArray());
			printWriter.flush();
			bufReader.close();
			printWriter.close();
			System.out.println("ok文件操作成功！");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void mkService(String path,String Model,String model){
		File readfile = new File(path+"resources/ModelService.java.templ");
		//String path = readfile.getPath();//文件路径
		String absolutepath = readfile.getAbsolutePath();//文件的绝对路径
		//////// 开始挨个的读取文件  ////////
		BufferedReader bufReader;
		PrintWriter printWriter;
		try {
			bufReader = new BufferedReader(new InputStreamReader(new FileInputStream(absolutepath)));
			//数据流读取文件
			StringBuffer strBuffer = new StringBuffer();
			for (String temp = null; (temp = bufReader.readLine()) != null; temp = null) {
				if(temp.indexOf("${Model}") != -1 || temp.indexOf("${model}") != -1){ //判断当前行是否存在想要替换掉的字符 -1表示存在
					temp = temp.replace("${Model}", Model);
					temp = temp.replace("${model}", model);//替换为你想要的东东
				}
				strBuffer.append(temp);
				strBuffer.append(System.getProperty("line.separator"));//行与行之间的分割
			}
			
			printWriter = new PrintWriter(path+"java/cn/ac/bcc/service/"+Model+"Service.java");//替换后输出的文件位置（切记这里的E:/ttt 在你的本地必须有这个文件夹）
			printWriter.write(strBuffer.toString().toCharArray());
			printWriter.flush();
			bufReader.close();
			printWriter.close();
			System.out.println("ok文件操作成功！");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
		// TODO Auto-generated method stub
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
		File configFile = new File("D:/new/workspace/easyframework/server/trunk/src/main/resources/generator/bccGeneratorConfig.xml");
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		List<TableConfiguration> tcs = config.getContexts().get(0).getTableConfigurations();
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		myBatisGenerator.generate(null);
		for(TableConfiguration tc:tcs){
			mkService("D:/new/workspace/easyframework/server/trunk/src/main/",tc.getDomainObjectName(),tc.getDomainObjectName().toLowerCase());
			mkController("D:/new/workspace/easyframework/server/trunk/src/main/",tc.getDomainObjectName(),tc.getDomainObjectName().toLowerCase());
		}

	}

}
