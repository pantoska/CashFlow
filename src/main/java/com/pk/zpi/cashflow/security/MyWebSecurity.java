package com.pk.zpi.cashflow.security;

import com.pk.zpi.cashflow.model.NoPopupBasicAuthenticationEntryPoint;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@EnableWebSecurity
@Configuration
public class MyWebSecurity extends WebSecurityConfigurerAdapter {

    private final MyUserDetailsService userDetailsService = new MyUserDetailsService();

    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(this.userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic().authenticationEntryPoint(new NoPopupBasicAuthenticationEntryPoint()).and()
                .authorizeRequests()
                .antMatchers(HttpMethod.GET, "/user/hello").permitAll()
                .antMatchers(HttpMethod.PUT, "/user/register").permitAll()
                .antMatchers(HttpMethod.GET, "/user/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.POST, "/user/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.DELETE, "/user/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.DELETE, "/user/admin").hasAnyRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/category/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.PUT, "/category/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.GET, "/expense/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.PUT, "/expense/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.POST, "/expense/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.GET, "/moneyAccount/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.PUT, "/moneyAccount/**").hasAnyRole("ADMIN", "USER")
                .antMatchers(HttpMethod.POST, "/moneyAccount/**").hasAnyRole("ADMIN", "USER")
                .and()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                .cors().and()
                .csrf().disable();
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource()
    {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:8080", "http://192.168.0.9:8081",
                "http://89.69.100.81:8081"));
        configuration.setAllowedMethods(Arrays.asList("GET","POST", "DELETE", "PUT"));
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public static NoOpPasswordEncoder passwordEncoder() {
        return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
    }
}
