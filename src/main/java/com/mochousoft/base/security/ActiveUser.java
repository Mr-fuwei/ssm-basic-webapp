package com.mochousoft.base.security;

import java.io.Serializable;

/**
 * 当前登录用户
 */
public class ActiveUser implements Serializable {

    private static final long serialVersionUID = 7372099313830686566L;

    private String id;
    private String username;
    private String realName;
}
