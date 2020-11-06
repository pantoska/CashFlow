package com.pk.zpi.cashflow.security;

import com.pk.zpi.cashflow.model.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class MyUserDetailsService implements UserDetailsService {
    private UserService userService = new UserService();

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        try {
            return null;
        } catch (Exception e) {
            throw new UsernameNotFoundException("Not found");
        }
    }
}
