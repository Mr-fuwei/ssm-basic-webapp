package com.mochousoft.base.security;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 用户名、密码和验证码Token
 */
public class UsernamePasswordCaptchaToken extends UsernamePasswordToken {

    private static final long serialVersionUID = 671829069679405624L;

    private String captcha;

    public UsernamePasswordCaptchaToken() {
        super();
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}
