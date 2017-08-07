package com.mochousoft.base.controller;

import com.alibaba.fastjson.JSONObject;
import com.mochousoft.base.security.UsernamePasswordCaptchaToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户通行证Controller
 */
@Controller
@RequestMapping("/passport")
public class PassportController {

    private static final Logger logger = LoggerFactory.getLogger(PassportController.class);

    /**
     * 跳转至登录页面
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String goLogin() {
        return "login";
    }

    /**
     * 校验登录
     *
     * @param username
     * @param password
     * @param captcha
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject doLogin(String username, String password, String captcha) {
        JSONObject jResult = new JSONObject();

        UsernamePasswordCaptchaToken token = new UsernamePasswordCaptchaToken();
        token.setUsername(username);
        token.setPassword(password.toCharArray());
        token.setCaptcha(captcha);
        token.setRememberMe(true);

        try {
            SecurityUtils.getSubject().login(token);
            jResult.put("status", true);
            jResult.put("message", "登录成功！");
        } catch (AuthenticationException e) {
            jResult.put("status", false);
            jResult.put("message", e.getMessage());
            logger.error("登录失败", e);
        } finally {
            token.clear();
        }

        return jResult;
    }
}