package com.wang.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFilePermission;
import java.util.HashSet;
import java.util.Set;

/**
 * 文件操作
 * @author wang926454
 *
 */
public class FileUtil {
	/**
	 * 将fileContent写入文件会自动创建文件夹和文件
	 * @param path 路径
	 * @param fileName 文件名
 	 * @param fileContent
	 */
	public static void writeTxtFileAndCreateDir(String path, String fileName, String fileContent) {
		try {
			// path表示你所创建文件夹的路径
			File f = new File(path);
			if (!f.exists()) {
				f.mkdirs();
			}
			// fileName表示你创建的文件名；为txt类型；
			File file = new File(f, fileName);
			if (!file.exists()) {
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			OutputStreamWriter write = new OutputStreamWriter(
					new FileOutputStream(file), "UTF-8");
			BufferedWriter writer = new BufferedWriter(write, 10 * 1024);
			writer.write(fileContent);
			writer.close();
		} catch (Exception e) {
			System.out.println("写文件内容操作出错");
			e.printStackTrace();
		}
	}
	
	/**
	 * 将fileContent写入文件会自动创建文件
	 * @param filePathAndName
	 * @param fileContent
	 */
	public static void writeTxtFile(String filePathAndName, String fileContent) {
		try {
			File f = new File(filePathAndName);
			if (!f.exists()) {
				f.createNewFile();
			}
			OutputStreamWriter write = new OutputStreamWriter(
					new FileOutputStream(f), "UTF-8");
			BufferedWriter writer = new BufferedWriter(write, 10 * 1024);
			writer.write(fileContent);
			writer.close();
		} catch (Exception e) {
			System.out.println("写文件内容操作出错");
			e.printStackTrace();
		}
	}
	
	/**
	 * 将文件读取出来返回String
	 * @param filePathAndName
	 * @return
	 */
	public static String readTxtFile(String filePathAndName) {
		String fileContent = "";
		try {
			File file = new File(filePathAndName);
			if (file.isFile() && file.exists()) { // 判断文件是否存在
				InputStreamReader read = new InputStreamReader(
						new FileInputStream(file), "UTF-8");// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read,
						10 * 1024);
				String lineTxt;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					fileContent += lineTxt;
				}
				read.close();
			} else {
				System.out.println("找不到指定的文件");
			}
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
			e.printStackTrace();
		}
		return fileContent;
	}
	
	/**
	 * 删除文件
	 * @param filePathAndName
	 * @return
	 */
	public static boolean deleteFile(String filePathAndName) {
		File file = new File(filePathAndName);
		// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				System.out.println("删除单个文件" + filePathAndName + "成功！");
				return true;
			} else {
				//System.out.println("删除单个文件" + filePathAndName + "失败！");
				return false;
			}
		} else {
			//System.out.println("删除单个文件失败：" + filePathAndName + "不存在！");
			return false;
		}
	}
	
	/**
	 * 使用NIO修改文件权限
	 * @param dirFile
	 * @throws IOException
	 */
	public static void changeFolderPermission(File dirFile) throws IOException {
	    Set<PosixFilePermission> perms = new HashSet<PosixFilePermission>();
	    perms.add(PosixFilePermission.OWNER_READ);
	    perms.add(PosixFilePermission.OWNER_WRITE);
	    perms.add(PosixFilePermission.OWNER_EXECUTE);
	    perms.add(PosixFilePermission.GROUP_READ);
	    perms.add(PosixFilePermission.GROUP_EXECUTE);
	    perms.add(PosixFilePermission.OTHERS_READ);
	    perms.add(PosixFilePermission.OTHERS_EXECUTE);
	    try {
	        Path path = Paths.get(dirFile.getAbsolutePath());
	        Files.setPosixFilePermissions(path, perms);
	    } catch (Exception e) {
	        //logger.log(Level.SEVERE, "Change folder " + dirFile.getAbsolutePath() + " permission failed.", e);
	    }
    }
	
}
