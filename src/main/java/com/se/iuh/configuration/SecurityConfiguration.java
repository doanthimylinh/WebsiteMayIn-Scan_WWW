package com.se.iuh.configuration;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	UserDetailsService userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());
	}
	

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().cors().disable().authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN")
				.anyRequest().permitAll().and().exceptionHandling().accessDeniedPage("/logout");

		String encodedErr = URLEncoder.encode("Đã xảy ra lỗi, vui lòng kiểm tra lại!", StandardCharsets.UTF_8.name());
		http.formLogin().loginPage("/logout").loginProcessingUrl("/login").usernameParameter("account")
				.passwordParameter("password").defaultSuccessUrl("/home")
				.failureUrl("/login?err=" + encodedErr).permitAll();
		http.logout().logoutSuccessUrl("/login").permitAll();
	}

}
