package cn.ac.bcc.shiro.filter;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;

import cn.ac.bcc.mapper.core.UserMapper;
import cn.ac.bcc.model.core.User;



public class SysUserFilter extends PathMatchingFilter {

	@Inject
	private UserMapper userMapper;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

        String username = (String)SecurityUtils.getSubject().getPrincipal();
        User user = new User();
		user.setAccountname(username);
        request.setAttribute("user", userMapper.select(user));
        return true;
    }
}