package net.frozerain.spring.salesdep.entity;

import org.springframework.security.core.GrantedAuthority;

public enum  Role implements GrantedAuthority {
    USER,
    ADMIN,
    SELLER,
    MANAGER;

    @Override
    public String getAuthority() {
        return name();
    }
}
