package cn.ac.bcc.util;

import cn.ac.bcc.model.core.User;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class PasswordHelper {
	private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private String algorithmName = "md5";
	private int hashIterations = 2;

	public void encryptPassword(User user) {
		String salt=randomNumberGenerator.nextBytes().toHex();
		user.setCredentialssalt(salt);
		String newPassword = new SimpleHash(algorithmName,user.getPassword(), ByteSource.Util.bytes(user.getAccountname()+salt),hashIterations).toHex();
		user.setPassword(newPassword);
	}
	public static void main(String[] args) {
		PasswordHelper passwordHelper = new PasswordHelper();
		User user = new User();
		user.setPassword("123456");
		user.setAccountname("admin");
		passwordHelper.encryptPassword(user);
		System.out.println(user);
	}
}
